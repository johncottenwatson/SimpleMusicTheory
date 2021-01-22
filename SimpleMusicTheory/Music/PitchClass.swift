//
//  PitchClass.swift
//  Sono
//
//  Created by John Watson on 1/16/21.
//

import Foundation

public enum PitchClass: Int {
    static let numPitchClasses = 12
    static let naturals: Array<PitchClass> = [.c, .d, .e, .f, .g, .a, .b]
    static let accidentals: Array<PitchClass> = [.cSharp, .dSharp, .fSharp, .gSharp, .aSharp]
    
    case c = 0
    case cSharp = 1
    case d = 2
    case dSharp = 3
    case e = 4
    case f = 5
    case fSharp = 6
    case g = 7
    case gSharp = 8
    case a = 9
    case aSharp = 10
    case b = 11
    
    public var name: String {
        switch(self) {
        case .c:
            return "C"
        case .cSharp:
            return "C#"
        case .d:
            return "D"
        case .dSharp:
            return "D#"
        case .e:
            return "E"
        case .f:
            return "F"
        case .fSharp:
            return "F#"
        case .g:
            return "G"
        case .gSharp:
            return "G#"
        case .a:
            return "A"
        case .aSharp:
            return "A#"
        case .b:
            return "B"
        }
    }
    
    public static func +(left: PitchClass, right: Int) -> PitchClass {
        let val = mod((left.rawValue + right), 12)
        return PitchClass(rawValue: val)!
    }
    
    public static func -(left: PitchClass, right: Int) -> PitchClass {
        let val = mod((left.rawValue - right + 12), 12)
        return PitchClass(rawValue: val)!
    }
    
    public static func random() -> PitchClass {
        return PitchClass(rawValue: Int.random(in: 0..<numPitchClasses))!
    }
}
