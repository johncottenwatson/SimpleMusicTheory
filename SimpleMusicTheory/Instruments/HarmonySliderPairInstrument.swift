//
//  HarmonySliderPairInstrument.swift
//  SimpleMusicTheory
//
//  Created by John Watson on 1/30/21.
//

import Foundation
import AudioKit

public class HarmonySliderPairInstrument: Instrument {
    let rampDuration = 0.25
    let boosterGain = 0.05
    
    private var booster: AKBooster
    private var mixer: AKMixer
    private var osc1: AKOscillator
    private var osc2: AKOscillator
    
    public init(frequency1: Double, frequency2: Double) {
        osc1 = AKOscillator(waveform: Wavetables.triangle, frequency: frequency1, amplitude: 0.0)
        osc1.rampDuration = 0.25
        
        osc2 = AKOscillator(waveform: Wavetables.triangle, frequency: frequency2, amplitude: 0.0)
        osc2.rampDuration = 0.25

        mixer = AKMixer()
        mixer.connect(input: osc1)
        mixer.connect(input: osc2)

        booster = AKBooster(mixer)
        
        booster.gain = 0.0
        booster.rampDuration = rampDuration
    }

    public func updateOsc1(frequency: Double) {
        osc1.frequency = frequency
        osc1.amplitude = normalizingFactor(frequency: frequency)
    }
    
    public func updateOsc2(frequency: Double) {
        osc2.frequency = frequency
        osc2.amplitude = normalizingFactor(frequency: frequency)
    }
    
    // Oscillators start out silent and are
    public override func start() {
        AudioManager.mainMixer.connect(input: booster)
        booster.gain = boosterGain

        osc1.start()
        osc2.start()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
            self.osc1.amplitude = normalizingFactor(frequency: 400.0)
            self.osc2.amplitude = normalizingFactor(frequency: 400.0)
        }
    }
    
    public override func stop() {
        booster.gain = 0.0
        
        DispatchQueue.main.asyncAfter(deadline: .now() + rampDuration) {
            self.osc1.detach()
            self.osc2.detach()
            self.mixer.detach()
            self.booster.detach()
        }

        //AudioManager.mainMixer.disconnectInput()
        print(AKManager.engine.attachedNodes.count)
    }
}
