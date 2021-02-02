//
//  SemitonesPractice.swift
//  Sono
//
//  Created by John Watson on 1/18/21.
//

import SwiftUI

struct SemitonesExercise: View {
    let isFlatLayout: Bool
    let root: PitchClass
    let semitoneGap: Int
    var correctPitchClassSet: Set<PitchClass> {
        let correctPitchClass = root + semitoneGap
        let set: Set<PitchClass> = [correctPitchClass]
        return set
    }

    @Binding var exerciseState: ExerciseState
    @Binding var exerciseCorrect: Bool
    @State var notes: Set<Note> = []

    var body: some View {
        VStack() {
            DescriptionText(text: Text("What note is ")
                                + Text("\(abs(semitoneGap)) ").bold()
                                + Text(((abs(semitoneGap) == 1) ? "semitone " : "semitones "))
                                + Text(semitoneGap < 0 ? "below " : "above ")
                                + Text("\(root.name)").bold()
                                + Text("?"))
            Spacer()
            Keyboard(numOctaves: 2, letterNames: true, isFlatLayout: isFlatLayout, isMonophonic: true, exerciseState: $exerciseState, notes: $notes, correctPitchClassSet: correctPitchClassSet)

            CheckButton(exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)
        }.onChange(of: exerciseState) { newState in
            if newState == .checking {
                let selectedPitchSet: Set<PitchClass> = Set(notes.map( {$0.pitchClass} ))

                exerciseCorrect = (selectedPitchSet == correctPitchClassSet)
                exerciseState = .answered
            }
        }
    }
}

struct SemitonesExercise_Previews: PreviewProvider {
    static var previews: some View {
        ZStack() {
            ColorPalette.blue
                .ignoresSafeArea()
            SemitonesExercise(isFlatLayout: false, root: .c, semitoneGap: 1, exerciseState: .constant(.active), exerciseCorrect: .constant(false))
        }
    }
}
