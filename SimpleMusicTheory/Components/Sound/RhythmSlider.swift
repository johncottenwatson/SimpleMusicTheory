//
//  RhythmSlider.swift
//  SimpleMusicTheory
//
//  Created by John Watson on 1/27/21.
//

import SwiftUI
import Combine

public struct RhythmSlider: View {

    @State var answered = false
    @State var alreadyStarted = false
    @Binding var exerciseState: ExerciseState
        
    // Period of metronome in seconds
    @State var hertz: Double = 2.0

    let minHertz: Double = 0.5
    let maxHertz: Double = 10.0
    let hertzThresholdToCompleteExercise = 6.0
    
    @State var metronomeInstrument: MetronomeInstrument!
    
    static let tickPeriod = 0.002
    @State var tick = Timer.publish(every: tickPeriod, on: .main, in: .common).autoconnect()
    @State var lastTimerTime: Double = CACurrentMediaTime()
    
    private func start() {
        metronomeInstrument = MetronomeInstrument()
        metronomeInstrument.start()
        self.alreadyStarted = true
    }
    
    private func formatLabel(_ value: Double) -> String {
        if value <= 0.5 {
            let period = Int(round(1.0 / value))
            // "Seconds" always plural because period guaranteed to be > 1
            return "1 beat every \(period) seconds"
        } else {
            let beatsPerSecond = Int(round(value))
            let plural = (beatsPerSecond != 1)
            return "\(beatsPerSecond) \(plural ? "beats" : "beat") per second"
        }
    }
    
    public var body: some View {
        VStack() {
            Slider(value: $hertz, in: minHertz ... maxHertz)
                .accentColor(ColorPalette.darkBlue)
                .padding(.vertical, 10.0)
                .padding(.horizontal, 20.0)
                .background(sliderBorder)
                .padding(.all, 20.0)
            Text(formatLabel(hertz))
                .font(.system(.title2, design: .rounded))
                .foregroundColor(ColorPalette.white)
                .animation(.none, value: hertz)
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
        }.onReceive(tick) { _ in
            let currentTime = CACurrentMediaTime()
            if currentTime > lastTimerTime + 1.0 / hertz {
                if alreadyStarted {
                    metronomeInstrument.pulse()
                }
                lastTimerTime =  currentTime
            }
            if !answered && hertz >= hertzThresholdToCompleteExercise {
                answered = true
                exerciseState = .answered
            }
        }
    }
    
    private var sliderBorder: some View {
        RoundedRectangle(cornerRadius: 12.0)
            .strokeBorder(ColorPalette.white, lineWidth: 4.0)
    }
}
