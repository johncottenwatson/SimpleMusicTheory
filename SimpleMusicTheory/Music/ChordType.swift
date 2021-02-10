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
    
    var intervalsString: String {
        var array = intervals.map { String($0) }
        array[0] = "root"
        return array.joined(separator: " ")
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
    
    var description: String {
        switch(self) {
        case .major:
            return "a common chord type that sounds very consonant"
        case .minor:
            return "common chord type that is also very consonant, but usually sounds darker than a major chord"
        case .majorAddNinth:
            return "NOT YET IMPLEMENTED"
        case .minorAddNinth:
            return "NOT YET IMPLEMENTED"
        case .majorSeventh:
            return "a jazzy chord type that sounds like a softer version of a major chord"
        case .minorSeventh:
            return "a jazzy chord type that sounds like a softer version of a minor chord"
        case .dominantSeventh:
            return "an unstable chord type that likes to be resolved into a more consonant chord"
        case .suspendedSecond:
            return "another simple chord type with a somewhat ambiguous feeling"
        case .suspendedFourth:
            return "another simple chord type with a somewhat ambiguous feeling"
        case .diminished:
            return "an unstable chord type that wants to be resolved into a more consonant chord"
        case .augmented:
            return "another unstable chord type that wants to be resolved into a more consonant chord"
        case .sixth:
            return "another jazzy chord type that feels like a softer version of a major chord"
        }
    }
    
    var remarkSentence: String? {
        switch(self) {
        case .major:
            return "To make a major chord, you need 3 notes:\n\n"
                + "A root note\n"
                + "The note 4 semitones above the root note\n"
                + "The note 7 semitones above the root note"
        case .minor:
            return "A minor chord is just a major chord with the middle note a semitone lower."
        case .majorAddNinth:
            return "NOT YET IMPLEMENTED"
        case .minorAddNinth:
            return "NOT YET IMPLEMENTED"
        case .majorSeventh:
            return "A major seventh chord is a major chord with the note 11 semitones above the root added on."
        case .minorSeventh:
            return "A minor seventh chord is a minor chord with the note 10 semitones above the root added on."
        case .dominantSeventh:
            return "A dominant seventh chord is just a major chord with the note 10 semitones above the root added on."
        case .suspendedSecond:
            return nil
        case .suspendedFourth:
            return nil
        case .diminished:
            return "A diminished chord is just a minor chord with the third note a semitone lower."
        case .augmented:
            return "An augmented chord is just a major chord with the third note a semitone higher."
        case .sixth:
            return "A major seventh chord is a major chord with the note 9 semitones above the root added on."
        }
    }
}
