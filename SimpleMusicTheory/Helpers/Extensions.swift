//
//  Extensions.swift
//  Sono
//
//  Created by John Watson on 12/29/20.
//

import Foundation

extension Comparable {
    func clamp(to limits: ClosedRange<Self>) -> Self {
        return min(max(self, limits.lowerBound), limits.upperBound)
    }
}

public func mod(_ a: Int, _ n: Int) -> Int {
    precondition(n > 0, "modulus must be positive")
    let result = a % n
    return (result >= 0) ? result : result + n
}
