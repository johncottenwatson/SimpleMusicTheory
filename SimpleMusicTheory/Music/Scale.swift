//
//  Scale.swift
//  SimpleMusicTheory
//
//  Created by John Watson on 1/23/21.
//

import Foundation

public struct Scale {
    public var root: PitchClass
    public var scaleType: ScaleType
    
    public var name: String {
        return root.name +  " " + scaleType.name
    }

    public var pitchClassArray: [PitchClass] {
        return scaleType.intervals.map( {root + $0 } )
    }
    
    public var pitchClassSet: Set<PitchClass> {
        return Set(pitchClassArray)
    }
    
    public func sharesPitchClasses(noteSet: Set<Note>) -> Bool {
        let otherPitchClassSet = Set(noteSet.map( {$0.pitchClass} ))
        return self.pitchClassSet == otherPitchClassSet
    }
}
