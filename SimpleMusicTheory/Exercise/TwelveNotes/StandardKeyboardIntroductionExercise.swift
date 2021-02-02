//
//  StandardKeyboardIntroductionExercise.swift
//  SimpleMusicTheory
//
//  Created by John Watson on 1/31/21.
//

import SwiftUI

struct StandardKeyboardIntroductionExercise: View {
    
    let correctPitchClassSet: Set<PitchClass> = [.cSharp]
    
    @Binding var exerciseState: ExerciseState
    @Binding var exerciseCorrect: Bool
    @State var notes: Set<Note> = []
    
    var body: some View {
        VStack() {
            DescriptionText(text: Text("Keyboard").bold()
                                + Text(" instruments rearrange the same 12 notes so it’s easier to reach more notes.\n\n")
                                + Text("What note is ")
                                + Text("1").bold()
                                + Text(" semitone above ")
                                + Text("C").bold()
                                + Text("?"))
            Spacer()
            Keyboard(numOctaves: 1, letterNames: true, isFlatLayout: false, isMonophonic: true, exerciseState: $exerciseState, notes: $notes, correctPitchClassSet: correctPitchClassSet)
            
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

struct StandardKeyboardIntroductionExercise_Previews: PreviewProvider {
    static var previews: some View {
        ZStack() {
            ColorPalette.blue
                .ignoresSafeArea()
            StandardKeyboardIntroductionExercise(exerciseState: .constant(.active), exerciseCorrect: .constant(false))
        }
    }
}
