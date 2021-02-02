//
//  ScaleIntroductionExercise.swift
//  SimpleMusicTheory
//
//  Created by John Watson on 2/1/21.
//

import SwiftUI

struct ScaleIntroductionExercise: View {

    let waitTime = 2.0
    
    @Binding var exerciseState: ExerciseState
    @Binding var exerciseCorrect: Bool
    
    var body: some View {
        VStack() {
            DescriptionText(text: Text("A ")
                                + Text("scale").bold()
                                + Text(", like a chord, is just a set of notes.\n\n")
                                + Text("Unlike a chord, the notes in a scale are not played all at the same time.\n\n")
                                + Text("Rather, a scale is a set of notes to choose from when making music."))

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

struct ScaleIntroductionExercise_Previews: PreviewProvider {
    static var previews: some View {
        ZStack() {
            ColorPalette.blue
                .ignoresSafeArea()
            ScaleIntroductionExercise(exerciseState: .constant(.active), exerciseCorrect: .constant(false))
        }
    }
}
