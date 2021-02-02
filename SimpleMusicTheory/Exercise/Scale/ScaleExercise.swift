//
//  ScaleExercise.swift
//  SimpleMusicTheory
//
//  Created by John Watson on 1/23/21.
//

import SwiftUI

struct ScaleExercise: View {

    let isFlatLayout: Bool
    let scale: Scale

    @Binding var exerciseState: ExerciseState
    @Binding var exerciseCorrect: Bool
    @State var notes: Set<Note> = []

    var body: some View {
        VStack() {
            DescriptionText(text: Text("Select the notes in a ")
                                + Text(scale.name).bold()
                                + Text(" scale."))
            Spacer()
            Keyboard(numOctaves: 2, letterNames: true, isFlatLayout: isFlatLayout, isMonophonic: false, exerciseState: $exerciseState, notes: $notes, correctPitchClassSet: scale.pitchClassSet)
            
            CheckButton(exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)
        }.onChange(of: exerciseState) { newState in
            if newState == .checking {
                exerciseCorrect = scale.sharesPitchClasses(noteSet: notes)
                exerciseState = .answered
            }
        }
    }
}

struct ScaleExercise_Previews: PreviewProvider {

    static let scale = Scale(root: .c, scaleType: .major)

    static var previews: some View {
        ZStack() {
            ColorPalette.blue
                .ignoresSafeArea()
            ScaleExercise(isFlatLayout: false, scale: scale, exerciseState: .constant(.active), exerciseCorrect: .constant(false))
        }
    }
}
