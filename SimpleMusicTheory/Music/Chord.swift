//
//  Chord.swift
//  Sono
//
//  Created by John Watson on 1/18/21.
//

import Foundation

public struct Chord: Hashable {
    public var root: PitchClass
    public var chordType: ChordType
    
    public var name: String {
        return root.name + chordType.name
    }
    
    public var longName: String {
        return root.name + " " + chordType.longName
    }

    public var pitchClassArray: [PitchClass] {
        return chordType.intervals.map( {root + $0 } )
    }
    
    public var pitchClassSet: Set<PitchClass> {
        return Set(pitchClassArray)
    }
    
    public func sharesPitchClasses(noteSet: Set<Note>) -> Bool {
        let otherPitchClassSet = Set(noteSet.map( {$0.pitchClass} ))
        return self.pitchClassSet == otherPitchClassSet
    }
    
    public static func random(legalChordTypes: Set<ChordType>) -> Chord {
        return Chord(root: PitchClass.random(), chordType: legalChordTypes.randomElement() ?? .major)
    }
}
