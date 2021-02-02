//
//  ScaleType.swift
//  SimpleMusicTheory
//
//  Created by John Watson on 1/23/21.
//

import Foundation

public enum ScaleType {
    case major
    case pentatonic
    case harmonicMinor
    case wholeTone
    
    var intervals: [Int] {
        switch(self) {
        case .major:
            return [0, 2, 4, 5, 7, 9, 11]
        case .pentatonic:
            return [0, 2, 4, 7, 9]
        case .harmonicMinor:
            return [0, 2, 3, 5, 7, 8, 11]
        case .wholeTone:
            return [0, 2, 4, 6, 8, 10]
        }
    }
    
    var intervalsString: String {
        var array = intervals.map { String($0) }
        array[0] = "root"
        return array.joined(separator: " ")
    }
    
    var name: String {
        switch(self) {
        case .major:
            return "major"
        case .pentatonic:
            return "pentatonic"
        case .harmonicMinor:
            return "harmonic minor"
        case .wholeTone:
            return "whole tone"
        }
    }
    
    var description: String {
        switch(self) {
        case .major:
            return "one of the most common scales"
        case .pentatonic:
            return "a simple scale with five notes"
        case .harmonicMinor:
            return "another seven note scale with more potential for dissonance than a major scale"
        case .wholeTone:
            return "a scale built from whole tones, or gaps of two semitones"
        }
    }
    
    var remarkSentence: String? {
        switch(self) {
        case .major:
            return "You can think of a major scale as a pentatonic scale with two extra notes added in."
        case .pentatonic:
            return nil
        case .harmonicMinor:
            return nil
        case .wholeTone:
            return nil
        }
    }
}
