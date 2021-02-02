//
//  ChordPractice.swift
//  Sono
//
//  Created by John Watson on 1/16/21.
//

import SwiftUI

struct ChordExercise: View {

    let isFlatLayout: Bool
    let chord: Chord
    
    @Binding var exerciseState: ExerciseState
    @Binding var exerciseCorrect: Bool
    @State var notes: Set<Note> = []
    
    var body: some View {
        VStack() {
            DescriptionText(text: Text("Select the notes in a ")
                                + Text("\(chord.longName)").bold()
                                + Text(" (\(chord.name)) chord."))
            Spacer()            
            Keyboard(numOctaves: 2, letterNames: true, isFlatLayout: isFlatLayout, isMonophonic: false, exerciseState: $exerciseState, notes: $notes, correctPitchClassSet: chord.pitchClassSet)
            
            CheckButton(exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)
        }.onChange(of: exerciseState) { newState in
            if newState == .checking {
                exerciseCorrect = chord.sharesPitchClasses(noteSet: notes)
                exerciseState = .answered
            }
        }
    }
}

struct ChordExercise_Previews: PreviewProvider {

    static let chord = Chord(root: .c, chordType: .major)
    
    static var previews: some View {
        ZStack() {
            ColorPalette.blue
                .ignoresSafeArea()
            ChordExercise(isFlatLayout: false, chord: chord, exerciseState: .constant(.active), exerciseCorrect: .constant(false))
        }
    }
}
