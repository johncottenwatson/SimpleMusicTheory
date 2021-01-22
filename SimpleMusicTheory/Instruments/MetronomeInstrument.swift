//
//  MetronomeInstrument.swift
//  Sono
//
//  Created by John Watson on 1/14/21.
//

import Foundation
import AudioKit

public class MetronomeInstrument: Instrument {

    let rampDuration = 0.25
    
    private var booster: AKBooster
    private var sampler: AKAppleSampler
    
    public override init() {
        sampler = AKAppleSampler()
        do {
            try sampler.loadWav("shaker")
        } catch {
            AKLog("Problem loading wav")
        }
        
        booster = AKBooster(sampler)
        booster.gain = 0.0
        booster.rampDuration = rampDuration
    }
    
    public override func start() {        
        AudioManager.mainMixer.connect(input: booster)
        booster.gain = 1.0
    }
    
    public override func stop() {
        booster.gain = 0.0
        
        DispatchQueue.main.asyncAfter(deadline: .now() + rampDuration) {
            self.sampler.detach()
            self.booster.detach()
        }

        //AudioManager.mainMixer.disconnectInput()
        print(AKManager.engine.attachedNodes.count)
    }
    
    public func pulse() {
        do {
            try sampler.play()
        } catch {
            AKLog("Problem playing sampler")
        }
    }
}
