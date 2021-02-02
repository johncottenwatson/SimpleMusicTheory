//
//  KeyboardInstrument.swift
//  Sono
//
//  Created by John Watson on 1/18/21.
//

import Foundation
import AudioKit

public class KeyboardInstrument: Instrument {

    let numOctaves: Int
    let lowestOctave = 4
    let rampDuration = 0.25
    let boosterGain = 0.1
    
    private var mixer: AKMixer
    private var booster: AKBooster
    
    private var oscDictionary: [Note: AKOscillator] = [:]
    
    public init(numOctaves: Int) {
        self.numOctaves = numOctaves
        mixer = AKMixer()
        for octave in lowestOctave ..< lowestOctave + numOctaves {
            for pitchClassIndex in 0 ..< PitchClass.numPitchClasses {
                let note = Note(pitchClass: PitchClass(rawValue: pitchClassIndex)!, octave: octave)
                let osc = AKOscillator(waveform: Wavetables.triangle, frequency: note.frequency, amplitude: 0.0)
                osc.rampDuration = 0.15
                oscDictionary[note] = osc
                mixer.connect(input: osc)
            }
        }
        let lastNote = Note(pitchClass: .c, octave: lowestOctave + numOctaves)
        let osc = AKOscillator(waveform: Wavetables.triangle, frequency: lastNote.frequency, amplitude: 0.0)
        osc.rampDuration = 0.15
        oscDictionary[lastNote] = osc
        mixer.connect(input: osc)
        
        booster = AKBooster(mixer)
        booster.gain = 0.0
        booster.rampDuration = rampDuration
    }
    
    public func updateNotesTo(notes: Set<Note>) {
        oscDictionary.keys.forEach {
            if (notes.contains( $0 )) {
                noteOn( $0 )
            } else {
                noteOff( $0 )
            }
        }
    }
    
    private func noteOn(_ note: Note) {
        oscDictionary[note]?.amplitude = normalizingFactor(frequency: note.frequency)
    }
    
    private func noteOff(_ note: Note) {
        oscDictionary[note]?.amplitude = 0.0
    }
    
    public override func start() {
        AudioManager.mainMixer.connect(input: booster)
        booster.gain = boosterGain
        
        oscDictionary.values.forEach {
            $0.start()
        }
    }
    
    public override func stop() {
        booster.gain = 0.0
        
        DispatchQueue.main.asyncAfter(deadline: .now() + rampDuration) {
            self.oscDictionary.values.forEach {
                $0.detach()
            }
            self.mixer.detach()
            self.booster.detach()
        }

        print(AKManager.engine.attachedNodes.count)
    }
}
