//
//  Note.swift
//  Sono
//
//  Created by John Watson on 1/16/21.
//

import Foundation

public struct Note: Hashable {
    
    private static let middleCFrequency = 261.625565
    private static let middleCOctave = 4
    
    public var isAccidental: Bool {
        return PitchClass.accidentals.contains(pitchClass)
    }
    
    public var pitchClass: PitchClass
    public var octave: Int
    
    public var name: String {
        return pitchClass.name
    }
    
    public var frequency: Double {
        return Note.middleCFrequency * pow(2, Double(octave - Note.middleCOctave) + Double(pitchClass.rawValue) / 12.0)
    }
}
