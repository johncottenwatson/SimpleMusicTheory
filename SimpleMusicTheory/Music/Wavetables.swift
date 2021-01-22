//
//  Wavetables.swift
//  Sono
//
//  Created by John Watson on 1/18/21.
//

import Foundation
import AudioKit

public struct Wavetables {
    public static let square = AKTable(.square, count: 256)
    public static let  triangle = AKTable(.triangle, count: 256)
    public static let  sine = AKTable(.sine, count: 256)
    public static let  sawtooth = AKTable(.sawtooth, count: 256)
}
