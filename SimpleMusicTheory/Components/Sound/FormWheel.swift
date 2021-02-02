//
//  FormWheel.swift
//  SimpleMusicTheory
//
//  Created by John Watson on 1/26/21.
//

import SwiftUI

public struct FormWheel: View {
    
    let radius: CGFloat = UIScreen.main.fixedCoordinateSpace.bounds.width * 0.4
    
    @State var alreadyStarted = false
    @Binding var exerciseState: ExerciseState
    
    // Period of metronome in seconds
    let period: Double
    
    var repeatingAnimation: Animation {
        Animation.linear(duration: Double(period))
            .repeatForever(autoreverses: false)
    }

    private func start() {
        alreadyStarted = true
    }
    
    public var body: some View {
        ZStack() {
            // Wheel
            Circle()
                .stroke(ColorPalette.white, lineWidth: 10)
                .frame(width: 2.0 * radius, height: 2.0 * radius)
            // Progress circle
            Circle()
                .foregroundColor(ColorPalette.darkBlue)
                .frame(width: 10, height: 10)
                .offset(x: radius, y: 0.0)
                .rotationEffect(Angle(radians: (alreadyStarted ? (2.0 * Double.pi) : 0.0) - Double.pi / 2.0))
                .animation(repeatingAnimation, value: alreadyStarted)
        }.onAppear() {
            print(cos(2.0 * Double.pi))
            if !self.alreadyStarted && exerciseState == .active {
                self.start()
            }
        }.onChange(of: exerciseState) { newState in
            if !self.alreadyStarted && newState == .active {
                self.start()
            } else if newState == .closing {
                exerciseState = .completed
            }
        }
    }
}
