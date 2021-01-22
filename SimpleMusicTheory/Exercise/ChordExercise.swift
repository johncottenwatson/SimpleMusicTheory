//
//  ChordPractice.swift
//  Sono
//
//  Created by John Watson on 1/16/21.
//

import SwiftUI

struct ChordExercise: View {

    let exerciseNum: Int
    let isFlatLayout: Bool
    let chord: Chord
    
    @Binding var exerciseState: ExerciseState
    @Binding var exerciseCorrect: Bool
    @State var notes: Set<Note> = []
    
    var body: some View {
        VStack() {
            HStack() {
                DescriptionText(text: Text("Select the notes in a ")
                                    + Text(chord.name).bold()
                                    + Text(" chord."))
                    .font(.system(.title2, design: .rounded))
                    .multilineTextAlignment(.leading)
                    .foregroundColor(ColorPalette.white)
                    .padding()
                    .layoutPriority(1)
                Spacer()
                    .frame(minWidth: 0, idealWidth: 0)
            }
            Spacer()            
            Keyboard(isFlatLayout: isFlatLayout, isMonophonic: false, exerciseState: $exerciseState, notes: $notes, correctPitchClassSet: chord.pitchClassSet)
            
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
            ChordExercise(exerciseNum: 0, isFlatLayout: false, chord: chord, exerciseState: .constant(.active), exerciseCorrect: .constant(false))
        }
    }
}
