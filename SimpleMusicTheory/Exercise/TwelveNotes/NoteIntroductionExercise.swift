//
//  NoteIntroductionExercise.swift
//  SimpleMusicTheory
//
//  Created by John Watson on 1/30/21.
//

import SwiftUI

struct NoteIntroductionExercise: View {
    @Binding var exerciseState: ExerciseState
    @Binding var exerciseCorrect: Bool
    
    @State var interacted = false
    
    var body: some View {
        VStack() {
            DescriptionText(text: Text("Pitches that are any number of octaves apart can be treated as the same ")
                                + Text("note").bold()
                                + Text(".\n\n")
                                + Text("That means that all of the pitches below are octaves of the same note."))
            Spacer()
            PitchPlayerGroup(interacted: $interacted, exerciseState: $exerciseState, pitches: [200.0, 400.0, 800.0, 1600.0])
            Spacer()
            
            ContinueButton(exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)
        }.onChange(of: interacted) { _ in
            exerciseState = .answered
        }
    }
}

struct NoteIntroductionExercise_Previews: PreviewProvider {
    static var previews: some View {
        ZStack() {
            ColorPalette.blue
                .ignoresSafeArea()
            NoteIntroductionExercise(exerciseState: .constant(.active), exerciseCorrect: .constant(false))
        }
    }
}

