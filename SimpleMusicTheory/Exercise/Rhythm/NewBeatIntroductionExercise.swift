//
//  BeatIntroductionExercise.swift
//  SimpleMusicTheory
//
//  Created by John Watson on 1/31/21.
//

import SwiftUI

struct NewBeatIntroductionExercise: View {
    
    let text: String
    let numBeats: Int
    let period = 0.7
    
    @Binding var exerciseState: ExerciseState
    @Binding var exerciseCorrect: Bool
    @State var currentBeatIndex = 0.0
    
    var body: some View {
        VStack() {
            DescriptionText(text: Text(text))
            Spacer()
            Metronome(exerciseState: $exerciseState, period: period, numBeats: numBeats)
            Spacer()
            
            ContinueButton(exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)
        }.onAppear() {
            DispatchQueue.main.asyncAfter(deadline: .now() + period * Double(numBeats) * 2.0) {
                exerciseState = .answered
            }
        }
    }
}

struct NewBeatIntroductionExercise_Previews: PreviewProvider {

    static let text = "One common way to think about rhythm is to split the basic beat into groups of 4 or 8."
    static let shakerRhythm = Rhythm(tempo: 120, numBeats: 4, beats: [true, false, true, false])

    static var previews: some View {
        ZStack() {
            ColorPalette.blue
                .ignoresSafeArea()
            NewBeatIntroductionExercise(text: text, numBeats: 4, exerciseState: .constant(.active), exerciseCorrect: .constant(false))
        }
    }
}
