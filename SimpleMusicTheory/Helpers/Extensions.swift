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
