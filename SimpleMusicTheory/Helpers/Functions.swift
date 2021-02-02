//
//  Functions.swift
//  SimpleMusicTheory
//
//  Created by John Watson on 1/29/21.
//

import Foundation

public func mod(_ a: Int, _ n: Int) -> Int {
    precondition(n > 0, "modulus must be positive")
    let result = a % n
    return (result >= 0) ? result : result + n
}

// Higher pitches are perceived as louder.
// Returns the multiplicative factor for any given frequency
// such that all frequencies sound more or less equally "loud"
public func normalizingFactor(frequency: Double ) -> Double {
    precondition(frequency > 0, "frequency must be positive")
    let cutoff = 800.0

    return ((cutoff - frequency) / cutoff).clamp(to: 0.5...1.0)
}

public func formatPitchClassArray(_ pitchClassArray: [PitchClass]) -> String {
    let array = pitchClassArray.map { $0.name }
    return array.joined(separator: " ")
}
