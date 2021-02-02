//
//  Rhythm.swift
//  SimpleMusicTheory
//
//  Created by John Watson on 1/25/21.
//

import Foundation

public struct Rhythm {
    // Tempo measured in beats per minute
    public var tempo: Int
    
    // Returns the period of the tempo in seconds
    public var period: Double {
        if tempo == 0 {
            return Double.greatestFiniteMagnitude
        }
        return 60.0 / Double(tempo)
    }
    
    public var numBeats: Int
    
    public var beats: [Bool]
}
