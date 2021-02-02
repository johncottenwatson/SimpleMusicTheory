//
//  Metronome.swift
//  Sono
//
//  Created by John Watson on 1/14/21.
//

import SwiftUI
import Combine

public struct Metronome: View {
    
    let animationDuration: Double = 0.08
    let emphasisScaleFactor: CGFloat = 1.35
    
    let smallerCircleConstrictedDiameter: CGFloat = 60
    let smallerCircleDilatedDiameter: CGFloat = 90
    let largerCircleConstrictedDiameter: CGFloat = 60
    let largerCircleDilatedDiameter: CGFloat = 140
    @State var dilated = false

    @State var alreadyStarted = false
    @Binding var exerciseState: ExerciseState
    
    // Period of metronome in seconds
    let period: Double
    @State var metronomeInstrument: MetronomeInstrument!
    
    // Optional numBeats field creates beat-counting subtext
    let numBeats: Int?
    
    @State var timer = Timer.publish(every: TimeInterval(Int.max), on: .main, in: .common).autoconnect()
    @State var timerCounter = 0
    
    private func start() {
        timer = Timer.publish(every: period / 2.0, on: .main, in: .common).autoconnect()
        metronomeInstrument = MetronomeInstrument()
        metronomeInstrument.start()
        self.alreadyStarted = true
    }
    
    public var body: some View {
        VStack() {
            ZStack() {
                // Larger circle
                Circle()
                    .frame(width: dilated ? largerCircleDilatedDiameter : largerCircleConstrictedDiameter)
                    .foregroundColor(ColorPalette.pink)
                // Smaller circle
                Circle()
                    .frame(width: dilated ? smallerCircleDilatedDiameter : smallerCircleConstrictedDiameter)
                    .foregroundColor(ColorPalette.white)
            }
            if numBeats != nil {
                HStack(alignment: .top) {
                    ForEach(0 ..< numBeats!) { index in
                        Text("\(index + 1)")
                            .font(.system(.largeTitle, design: .rounded))
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .foregroundColor(ColorPalette.white)
                            .scaleEffect(((timerCounter / 2) % numBeats! == index) ? emphasisScaleFactor : 1.0)
                            .animation(.easeInOut(duration: animationDuration), value: timerCounter)
                            .padding()
                    }
                }
            }
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
