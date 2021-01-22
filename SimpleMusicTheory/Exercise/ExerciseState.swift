//
//  ExerciseState.swift
//  Sono
//
//  Created by John Watson on 1/15/21.
//

import Foundation

public enum ExerciseState: Int, Comparable {
    case active = 0
    case checking = 1
    case answered = 2
    case closing = 3
    case completed = 4
    
    public static func < (a: ExerciseState, b: ExerciseState) -> Bool {
        return a.rawValue < b.rawValue
    }
}
