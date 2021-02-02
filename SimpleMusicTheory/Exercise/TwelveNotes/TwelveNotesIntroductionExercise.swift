//
//  TwelveNotesIntroductionExercise.swift
//  SimpleMusicTheory
//
//  Created by John Watson on 1/30/21.
//

import SwiftUI

struct TwelveNotesIntroductionExercise: View {
    
    let correctPitchClassSet: Set<PitchClass> = [.c]
    
    @Binding var exerciseState: ExerciseState
    @Binding var exerciseCorrect: Bool
    @State var notes: Set<Note> = []
    
    var body: some View {
        VStack() {
            DescriptionText(text: Text("Music is pretty boring with just one note though...\n\n")
                                + Text("Here’s one way to add more notes: we can split each octave into ")
                                + Text("12").bold()
                                + Text(" equally spaced notes.\n\n")
                                + Text("Select ")
                                + Text("note 1").bold()
                                + Text("."))
            Spacer()
            Keyboard(numOctaves: 1, letterNames: false, isFlatLayout: true, isMonophonic: true, exerciseState: $exerciseState, notes: $notes, correctPitchClassSet: correctPitchClassSet)
            
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

struct TwelveNotesIntroductionExercise_Previews: PreviewProvider {
    static var previews: some View {
        ZStack() {
            ColorPalette.blue
                .ignoresSafeArea()
            TwelveNotesIntroductionExercise(exerciseState: .constant(.active), exerciseCorrect: .constant(false))
        }
    }
}

