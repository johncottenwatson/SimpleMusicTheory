//
//  SemitoneIntroductionExercise.swift
//  SimpleMusicTheory
//
//  Created by John Watson on 1/30/21.
//

import SwiftUI

struct SemitoneIntroductionExercise: View {
    
    let correctPitchClassSet: Set<PitchClass> = [.d]
    
    @Binding var exerciseState: ExerciseState
    @Binding var exerciseCorrect: Bool
    @State var notes: Set<Note> = []
    
    var body: some View {
        VStack() {
            DescriptionText(text: Text("If a note is a one note higher than another note, it’s a ")
                                + Text("semitone").bold()
                                + Text(" above the first note\n\n")
                                + Text("For example, C# is 1 semitone above C.\n\n")
                                + Text("What note is ")
                                + Text("1").bold()
                                + Text(" semitone above ")
                                + Text("C#").bold()
                                + Text("?"))
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

struct SemitoneIntroductionExercise_Previews: PreviewProvider {
    static var previews: some View {
        ZStack() {
            ColorPalette.blue
                .ignoresSafeArea()
            SemitoneIntroductionExercise(exerciseState: .constant(.active), exerciseCorrect: .constant(false))
        }
    }
}
