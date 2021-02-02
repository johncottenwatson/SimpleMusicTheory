//
//  RhythmKitInstrument.swift
//  SimpleMusicTheory
//
//  Created by John Watson on 1/25/21.
//

import Foundation
import AudioKit

public class RhythmKitInstrument: Instrument {
    
    let rampDuration = 0.25
    let boosterGain = 0.1

    private var mixer: AKMixer
    private var mainBooster: AKBooster

    private var shakerSampler: AKAppleSampler
    private var woodblockSampler: AKAppleSampler
    private var shakerBooster: AKBooster
    private var woodblockBooster: AKBooster

    public override init() {
        shakerSampler = AKAppleSampler()
        woodblockSampler = AKAppleSampler()
        do {
            try shakerSampler.loadWav("shaker")
            try woodblockSampler.loadWav("woodblock")
        } catch {
            AKLog("Problem loading wav")
        }
        shakerBooster = AKBooster(shakerSampler)
        woodblockBooster = AKBooster(woodblockSampler)

        mixer = AKMixer()
        mixer.connect(input: shakerBooster)
        mixer.connect(input: woodblockBooster)
        shakerBooster.gain = 1.0
        shakerBooster.rampDuration = rampDuration
        woodblockBooster.gain = 1.0
        woodblockBooster.rampDuration = rampDuration

        mainBooster = AKBooster(mixer)
        mainBooster.gain = 0.0
        mainBooster.rampDuration = rampDuration
    }
    
    public func pulseShaker() {
        do {
            try shakerSampler.play()
        } catch {
            AKLog("Problem playing shaker sampler")
        }
    }
    
    public func pulseWoodblock() {
        do {
            try woodblockSampler.play()
        } catch {
            AKLog("Problem playing woodblock sampler")
        }
    }
    
    public func muteShaker() {
        shakerBooster.gain = 0.0
    }
    
    public func unmuteShaker() {
        shakerBooster.gain = 1.0
    }
    
    public func muteWoodblock() {
        woodblockBooster.gain = 0.0
    }
    
    public func unmuteWoodblock() {
        woodblockBooster.gain = 1.0
    }
    
    public override func start() {
        AudioManager.mainMixer.connect(input: mainBooster)
        mainBooster.gain = 1.0
    }
    
    public override func stop() {
        mainBooster.gain = 0.0
        
        DispatchQueue.main.asyncAfter(deadline: .now() + rampDuration) {
            self.shakerSampler.detach()
            self.woodblockSampler.detach()
            self.shakerBooster.detach()
            self.woodblockBooster.detach()
            self.mixer.detach()
            self.mainBooster.detach()
        }

        print(AKManager.engine.attachedNodes.count)
    }
}
