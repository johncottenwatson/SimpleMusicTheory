//
//  RhythmToPitchSlider.swift
//  SimpleMusicTheory
//
//  Created by John Watson on 1/28/21.
//

import SwiftUI
import Combine

public struct RhythmToPitchSlider: View {

    @State var answered = false
    @State var alreadyStarted = false
    @Binding var exerciseState: ExerciseState

    // Variable for scaling slider to hertz logarithmically
    // Equals the number of octaves away from 1.0 Hz
    @State var normalOctave: Double = 1.0

    // Max hertz for the shaker
    let maxShakerHertz = 100.0

    // Min hertz for the oscillator
    let minOscillatorHertz = 1.0

    // Hertz of shaker / oscillator
    var hertz: Double {
        return pow(2.0, normalOctave)
    }

    var shakerGain: Double {
        let minOscillatorNormalOctave = log2(minOscillatorHertz)
        let maxShakerNormalOctave = log2(maxShakerHertz)
        let gain = (maxShakerNormalOctave - normalOctave) / (maxShakerNormalOctave - minOscillatorNormalOctave)
        return gain.clamp(to: 0...1)
    }

    var oscillatorAmplitude: Double {
        let minOscillatorNormalOctave = log2(minOscillatorHertz)
        let maxShakerNormalOctave = log2(maxShakerHertz)
        let gain = (normalOctave - minOscillatorNormalOctave) / (maxShakerNormalOctave - minOscillatorNormalOctave)
        return gain.clamp(to: 0...1)
    }

    let minNormalOctave: Double = -1.0
    let maxNormalOctave: Double = 10.2288
    let hertzThresholdToCompleteExercise = 200.0

    @State var rhythmToPitchInstrument: RhythmToPitchInstrument!

    static let tickPeriod = 0.002
    @State var tick = Timer.publish(every: tickPeriod, on: .main, in: .common).autoconnect()
    @State var lastTimerTime: Double = CACurrentMediaTime()
    
    private func start() {
        rhythmToPitchInstrument = RhythmToPitchInstrument()
        rhythmToPitchInstrument.start()
        self.alreadyStarted = true
    }

    private func formatLabel(_ value: Double) -> String {
        if value <= 0.5 {
            let period = Int(round(1.0 / value))
            // "Seconds" always plural because period guaranteed to be > 1
            return "1 beat every \(period) seconds (\(hertz) Hz)"
        } else {
            let beatsPerSecond = Int(round(value))
            let plural = (beatsPerSecond != 1)
            return "\(beatsPerSecond) \(plural ? "beats" : "beat") per second (\(beatsPerSecond) Hz)"
        }
    }

    public var body: some View {
        VStack() {
            Slider(value: $normalOctave, in: minNormalOctave ... maxNormalOctave)
                .accentColor(ColorPalette.darkBlue)
                .padding(.vertical, 10.0)
                .padding(.horizontal, 20.0)
                .background(sliderBorder)
                .padding(.all, 20.0)
                .onChange(of: normalOctave) { _ in
                    rhythmToPitchInstrument.updateOsc(frequency: hertz, amplitude: oscillatorAmplitude)
                }
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
                rhythmToPitchInstrument.stop()
                exerciseState = .completed
            }
        }.onReceive(tick) { _ in
            let currentTime = CACurrentMediaTime()
            if currentTime > lastTimerTime + 1.0 / min(hertz, maxShakerHertz) {
                if alreadyStarted {
                    rhythmToPitchInstrument.pulse(gain: shakerGain)
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
