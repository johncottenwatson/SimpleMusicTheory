//
//  LetterNamesIntroductionExercise.swift
//  SimpleMusicTheory
//
//  Created by John Watson on 1/30/21.
//

import SwiftUI

struct LetterNamesIntroductionExercise: View {
    
    let correctPitchClassSet: Set<PitchClass> = [.gSharp]
    
    @Binding var exerciseState: ExerciseState
    @Binding var exerciseCorrect: Bool
    @State var notes: Set<Note> = []
    
    var body: some View {
        VStack() {
            DescriptionText(text: Text("We usually use letter names for these 12 notes, with C as the first note\n\n")
                                + Text("C# is pronounced “C sharp.”\n\n")
                                + Text("Select ")
                                + Text("G sharp").bold()
                                + Text("."))
            Spacer()
            Keyboard(numOctaves: 1, letterNames: true, isFlatLayout: true, isMonophonic: true, exerciseState: $exerciseState, notes: $notes, correctPitchClassSet: correctPitchClassSet)

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

struct LetterNamesIntroductionExercise_Previews: PreviewProvider {
    static var previews: some View {
        ZStack() {
            ColorPalette.blue
                .ignoresSafeArea()
            LetterNamesIntroductionExercise(exerciseState: .constant(.active), exerciseCorrect: .constant(false))
        }
    }
}
