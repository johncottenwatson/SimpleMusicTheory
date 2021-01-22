//
//  KeyboardInstrument.swift
//  Sono
//
//  Created by John Watson on 1/18/21.
//

import Foundation
import AudioKit

public class KeyboardInstrument: Instrument {

    let lowestOctave = 4
    let numOctaves = 2
    let rampDuration = 0.25
    
    private var mixer: AKMixer
    private var booster: AKBooster
    
    private var oscDictionary: [Note: AKOscillator] = [:]
    
    public override init() {
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
        oscDictionary[note]?.amplitude = 1.0
    }
    
    private func noteOff(_ note: Note) {
        oscDictionary[note]?.amplitude = 0.0
    }
    
    public override func start() {
        AudioManager.mainMixer.connect(input: booster)
        booster.gain = 1.0
        
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

        //AudioManager.mainMixer.disconnectInput()
        print(AKManager.engine.attachedNodes.count)
    }
}
