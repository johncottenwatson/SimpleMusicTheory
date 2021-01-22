//
//  Instrument.swift
//  Sono
//
//  Created by John Watson on 1/18/21.
//

import Foundation

public class Instrument {
    func start() {
        preconditionFailure("This method must be overridden")
    }
    func stop() {
        preconditionFailure("This method must be overridden")
    }
}
