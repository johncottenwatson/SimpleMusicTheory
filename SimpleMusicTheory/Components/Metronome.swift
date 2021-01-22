//
//  Metronome.swift
//  Sono
//
//  Created by John Watson on 1/14/21.
//

import SwiftUI
import Combine

public struct Metronome: View {
    
    let smallerCircleConstrictedDiameter: CGFloat = 60
    let smallerCircleDilatedDiameter: CGFloat = 90
    let largerCircleConstrictedDiameter: CGFloat = 60
    let largerCircleDilatedDiameter: CGFloat = 140
    @State var dilated = false

    @State var alreadyStarted = false
    @Binding var exerciseState: ExerciseState
    
    // Period of metronome in seconds
    let period: Float
    @State var metronomeInstrument: MetronomeInstrument!
    
    @State var timer = Timer.publish(every: 0, on: .main, in: .common).autoconnect()
    @State var timerCounter = 0
    
    private func start() {
        timer = Timer.publish(every: Double(period / 2.0), on: .main, in: .common).autoconnect()
        metronomeInstrument = MetronomeInstrument()
        metronomeInstrument.start()
        self.alreadyStarted = true
    }
    
    public var body: some View {
        ZStack() {
            // Larger circle
            Circle()
                .frame(width: dilated ? largerCircleDilatedDiameter : largerCircleConstrictedDiameter)
                .foregroundColor(ColorPalette.pink)
            // Smaller circle
            Circle()
                .frame(width: dilated ? smallerCircleDilatedDiameter : smallerCircleConstrictedDiameter)
                .foregroundColor(ColorPalette.white)
        }.onAppear() {
            if !self.alreadyStarted && exerciseState == .active {
                self.start()
            }
        }.onChange(of: exerciseState) { newState in
            if !self.alreadyStarted && newState == .active {
                self.start()
            } else if newState == .closing {
                metronomeInstrument.stop()
                exerciseState = .completed
            }
        }.onReceive(timer) { _ in
            timerCounter += 1
            dilated.toggle()
            if (alreadyStarted && timerCounter % 2 == 0) {
                metronomeInstrument.pulse()
            }
        }
    }
}
