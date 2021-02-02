//
//  PitchPlayerGroupInstrument.swift
//  SimpleMusicTheory
//
//  Created by John Watson on 1/30/21.
//

import Foundation
import AudioKit

public class PitchPlayerGroupInstrument: Instrument {
    let rampDuration = 0.25
    var boosterGain: Double {
        return 0.1 / oscillators.count
    }
    
    private var booster: AKBooster
    private var mixer: AKMixer
    private var oscillators: [AKOscillator]
    
    public init(pitches: [Double]) {
        mixer = AKMixer()
        
        oscillators = []
        for pitch in pitches {
            let osc = AKOscillator(waveform: Wavetables.triangle, frequency: pitch, amplitude: 0.0)
            osc.rampDuration = 0.25
            oscillators.append(osc)
            mixer.connect(input: osc)
        }

        booster = AKBooster(mixer)
        
        booster.gain = 0.0
        booster.rampDuration = rampDuration
    }

    public func mute(index: Int) {
        oscillators[index].amplitude = 0.0
    }
    
    public func unmute(index: Int) {
        oscillators[index].amplitude = 1.0
    }
    
    public override func start() {
        AudioManager.mainMixer.connect(input: booster)
        booster.gain = boosterGain
        
        self.oscillators.forEach {
            $0.start()
        }
    }
    
    public override func stop() {
        booster.gain = 0.0
        
        DispatchQueue.main.asyncAfter(deadline: .now() + rampDuration) {
            self.oscillators.forEach {
                $0.detach()
            }
            self.mixer.detach()
            self.booster.detach()
        }

        //AudioManager.mainMixer.disconnectInput()
        print(AKManager.engine.attachedNodes.count)
    }
}

