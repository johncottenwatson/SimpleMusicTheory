//
//  ChordType.swift
//  Sono
//
//  Created by John Watson on 1/18/21.
//

import Foundation

public enum ChordType {
    case major
    case minor
    case majorAddNinth
    case minorAddNinth
    case majorSeventh
    case minorSeventh
    case dominantSeventh
    case suspendedSecond
    case suspendedFourth
    case diminished
    case augmented
    case sixth
    
    var intervals: [Int] {
        switch(self) {
        case .major:
            return [0, 4, 7]
        case .minor:
            return [0, 3, 7]
        case .majorAddNinth:
            return [0, 2, 4, 7]
        case .minorAddNinth:
            return [0, 2, 3, 7]
        case .majorSeventh:
            return [0, 4, 7, 11]
        case .minorSeventh:
            return [0, 3, 7, 10]
        case .dominantSeventh:
            return [0, 4, 7, 10]
        case .suspendedSecond:
            return [0, 2, 7]
        case .suspendedFourth:
            return [0, 5, 7]
        case .diminished:
            return [0, 3, 6]
        case .augmented:
            return [0, 4, 8]
        case .sixth:
            return [0, 4, 7, 9]
        }
    }
    
    var name: String {
        switch(self) {
        case .major:
            return ""
        case .minor:
            return "m"
        case .majorAddNinth:
            return "add9"
        case .minorAddNinth:
            return "madd9"
        case .majorSeventh:
            return "maj7"
        case .minorSeventh:
            return "m7"
        case .dominantSeventh:
            return "7"
        case .suspendedSecond:
            return "sus2"
        case .suspendedFourth:
            return "sus4"
        case .diminished:
            return "dim"
        case .augmented:
            return "aug"
        case .sixth:
            return "6"
        }
    }
    
    var longName: String {
        switch(self) {
        case .major:
            return "major"
        case .minor:
            return "minor"
        case .majorAddNinth:
            return "major add ninth"
        case .minorAddNinth:
            return "minor add ninth"
        case .majorSeventh:
            return "major seventh"
        case .minorSeventh:
            return "minor seventh"
        case .dominantSeventh:
            return "dominant seventh"
        case .suspendedSecond:
            return "suspended second"
        case .suspendedFourth:
            return "suspended fourth"
        case .diminished:
            return "diminished"
        case .augmented:
            return "augmented"
        case .sixth:
            return "sixth"
        }
    }
}
