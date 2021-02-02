//
//  AudioManager.swift
//  Sono
//
//  Created by John Watson on 1/14/21.
//

import Foundation
import AudioKit

public class AudioManager {
    
    public static let mainMixer = AKMixer()

    public static let singleton = AudioManager()
    
    // TEMP: Start method in place of init to counteract lazy initialization of static singleton
    public static func start() {
        AKSettings.playbackWhileMuted = true
        AKManager.output = AudioManager.mainMixer
        do {
            try AKManager.start()
        } catch {
            AKLog("Trouble starting AKManager")
        }
    }
}
