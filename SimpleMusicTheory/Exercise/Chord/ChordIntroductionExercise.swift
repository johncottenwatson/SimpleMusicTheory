//
//  ChordIntroductionExercise.swift
//  SimpleMusicTheory
//
//  Created by John Watson on 2/1/21.
//

import SwiftUI

struct ChordIntroductionExercise: View {

    let waitTime = 2.0
    
    @Binding var exerciseState: ExerciseState
    @Binding var exerciseCorrect: Bool
    
    var body: some View {
        VStack() {
            DescriptionText(text: Text("A ")
                                + Text("chord").bold()
                                + Text(" is a set of three or more notes.\n\n")
                                + Text("Every chord has a ")
                                + Text("root note").bold()
                                + Text(" and a ")
                                + Text("chord type").bold()
                                + Text(".\n\n")
                                + Text("In a C major chord, for example, C is the root note and major is the chord type."))

            Spacer()
            ContinueButton(exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)
        }.onAppear() {
            DispatchQueue.main.asyncAfter(deadline: .now() + waitTime) {
                exerciseState = .answered
            }
        }.onChange(of: exerciseState) { newState in
            if newState == .closing {
                exerciseState = .completed
            }
        }
    }
}

struct ChordIntroductionExercise_Previews: PreviewProvider {
    static var previews: some View {
        ZStack() {
            ColorPalette.blue
                .ignoresSafeArea()
            ChordIntroductionExercise(exerciseState: .constant(.active), exerciseCorrect: .constant(false))
        }
    }
}

