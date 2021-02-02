//
//  RhythmToPitchInstrument.swift
//  SimpleMusicTheory
//
//  Created by John Watson on 1/28/21.
//

import Foundation
import AudioKit

public class RhythmToPitchInstrument: Instrument {
    let rampDuration = 0.25
    
    private var booster: AKBooster
    private var mixer: AKMixer
    private var osc: AKOscillator
    private var samplerBooster: AKBooster
    private var sampler: AKAppleSampler
    
    public override init() {
        sampler = AKAppleSampler()
        do {
            try sampler.loadWav("woodblock")
        } catch {
            AKLog("Problem loading wav")
        }
        samplerBooster = AKBooster(sampler)
        samplerBooster.gain = 1.0
        samplerBooster.rampDuration = 0.01
        
        osc = AKOscillator(waveform: Wavetables.sawtooth, frequency: 0, amplitude: 0.0)
        osc.rampDuration = 0.01

        mixer = AKMixer()
        mixer.connect(input: samplerBooster)
        mixer.connect(input: osc)

        booster = AKBooster(mixer)
        
        booster.gain = 0.0
        booster.rampDuration = rampDuration
    }

    public func updateOsc(frequency: Double, amplitude: Double) {
        osc.frequency = frequency
        osc.amplitude = amplitude * 0.05 * normalizingFactor(frequency: frequency)
    }
    
    public override func start() {
        AudioManager.mainMixer.connect(input: booster)
        booster.gain = 1.0
        
        osc.start()
    }
    
    public override func stop() {
        booster.gain = 0.0
        
        DispatchQueue.main.asyncAfter(deadline: .now() + rampDuration) {
            self.sampler.detach()
            self.samplerBooster.detach()
            self.osc.detach()
            self.mixer.detach()
            self.booster.detach()
        }

        //AudioManager.mainMixer.disconnectInput()
        print(AKManager.engine.attachedNodes.count)
    }
    
    public func pulse(gain: Double) {
        samplerBooster.gain = gain
        do {
            try sampler.play()
        } catch {
            AKLog("Problem playing sampler")
        }
    }
}

