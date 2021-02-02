//
//  PitchPlayerGroup.swift
//  SimpleMusicTheory
//
//  Created by John Watson on 1/30/21.
//

import SwiftUI
import Combine

public struct PitchPlayerGroup: View {

    @State var alreadyStarted = false
    @Binding var interacted: Bool
    @Binding var exerciseState: ExerciseState
    
    let pitches: [Double]
    @State var muted: [Bool]?

    @State var pitchPlayerGroupInstrument: PitchPlayerGroupInstrument!
    
    private func start() {
        pitchPlayerGroupInstrument = PitchPlayerGroupInstrument(pitches: pitches)
        pitchPlayerGroupInstrument.start()
        self.alreadyStarted = true
    }
    
    private func toggleMuted(_ index: Int) {
        if !interacted {
            interacted = true
        }
        muted?[index].toggle()
        if muted?[index] ?? false {
            pitchPlayerGroupInstrument.mute(index: index)
        } else {
            pitchPlayerGroupInstrument.unmute(index: index)
        }
    }
    
    public var body: some View {
        HStack(alignment: .top) {
            ForEach(0 ..< pitches.count) { index in
                VStack() {
                    Text("\(Int(round(pitches[index]))) Hz")
                        .font(.system(.body, design: .rounded))
                    Button(action: {
                        toggleMuted(index)
                    }) {
                        Image(systemName: (muted?[index] ?? false) ? "speaker.fill" : "speaker.3.fill")
                            .padding(.all, 5.0)
                    }.font(.system(.title2, design: .rounded))
                }
                .foregroundColor(ColorPalette.white)
                .padding(.all, 5.0)
                .animation(.none, value: muted)
            }
        }.onAppear() {
            muted = Array(repeating: true, count: pitches.count)
            if !self.alreadyStarted && exerciseState == .active {
                self.start()
            }
        }.onChange(of: exerciseState) { newState in
            if !self.alreadyStarted && newState == .active {
                self.start()
            } else if newState == .closing {
                pitchPlayerGroupInstrument.stop()
                exerciseState = .completed
            }
        }
    }
}
