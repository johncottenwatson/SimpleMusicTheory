//
//  HarmonySliderPair.swift
//  SimpleMusicTheory
//
//  Created by John Watson on 1/30/21.
//

import SwiftUI
import Combine

public struct HarmonySliderPair: View {

    @State var alreadyStarted = false
    @Binding var exerciseState: ExerciseState
    @Binding var moved: Bool
    
    // Variable for scaling slider2 to hertz logarithmically
    // Equals the number of octaves away from 1.0 Hz
    @State var normalOctave1: Double = 8.64385618977
    @State var normalOctave2: Double = 8.64385618977
    
    // Frequency of first slider osc
    var hertz1: Double {
        return pow(2.0, normalOctave1)
    }
    // Frequency of second slider osc
    var hertz2: Double {
        return pow(2.0, normalOctave2)
    }

    // 400 Hz
    let minNormalOctave: Double = 8.64385618977
    // 1600 Hz
    let maxNormalOctave: Double = 10.64385618977
    
    @State var harmonySliderPairInstrument: HarmonySliderPairInstrument!
    
    private func start() {
        harmonySliderPairInstrument = HarmonySliderPairInstrument(frequency1: hertz1, frequency2: hertz2)
        harmonySliderPairInstrument.start()
        self.alreadyStarted = true
    }
    
    public var body: some View {
        VStack() {
            Slider(value: $normalOctave1, in: minNormalOctave ... maxNormalOctave)
                .accentColor(ColorPalette.darkBlue)
                .padding(.vertical, 10.0)
                .padding(.horizontal, 20.0)
                .background(sliderBorder)
                .padding(.all, 20.0)
                .onChange(of: normalOctave1) { _ in
                    harmonySliderPairInstrument.updateOsc1(frequency: hertz1)
                    if !moved {
                        moved = true
                    }
                }
            Text("\(Int(round(hertz1))) Hz")
                .font(.system(.title2, design: .rounded))
                .foregroundColor(ColorPalette.white)
                .padding(.top, -10)
                .animation(.none, value: hertz1)
            Slider(value: $normalOctave2, in: minNormalOctave ... maxNormalOctave)
                .accentColor(ColorPalette.darkBlue)
                .padding(.vertical, 10.0)
                .padding(.horizontal, 20.0)
                .background(sliderBorder)
                .padding(.all, 20.0)
                .onChange(of: normalOctave2) { _ in
                    harmonySliderPairInstrument.updateOsc2(frequency: hertz2)
                    if !moved {
                        moved = true
                    }
                }
            Text("\(Int(round(hertz2))) Hz")
                .font(.system(.title2, design: .rounded))
                .foregroundColor(ColorPalette.white)
                .padding(.top, -10)
                .animation(.none, value: hertz2)
        }.onAppear() {
            if !self.alreadyStarted && exerciseState == .active {
                self.start()
            }
        }.onChange(of: exerciseState) { newState in
            if !self.alreadyStarted && newState == .active {
                self.start()
            } else if newState == .closing {
                harmonySliderPairInstrument.stop()
                exerciseState = .completed
            }
        }
    }
    
    private var sliderBorder: some View {
        RoundedRectangle(cornerRadius: 12.0)
            .strokeBorder(ColorPalette.white, lineWidth: 4.0)
    }
}
