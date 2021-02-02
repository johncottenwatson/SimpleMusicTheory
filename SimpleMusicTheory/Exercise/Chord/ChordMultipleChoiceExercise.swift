//
//  ChordMultipleChoiceExercise.swift
//  SimpleMusicTheory
//
//  Created by John Watson on 2/1/21.
//

import SwiftUI

struct ChordMultipleChoiceExercise: View {

    let chord: Chord
    
    @Binding var exerciseState: ExerciseState
    @Binding var exerciseCorrect: Bool
    
    let answers: [String]
    let correctAnswerIndex: Int
    
    init(chord: Chord, exerciseState: Binding<ExerciseState>, exerciseCorrect: Binding<Bool>) {
        self.chord = chord
        self._exerciseState = exerciseState
        self._exerciseCorrect = exerciseCorrect
        let correctPitchClassArray = chord.pitchClassArray
        var aberrations: Set<Array<PitchClass>> = []
        while aberrations.count < 3 {
            var newMember = correctPitchClassArray
            for i in 1 ..< newMember.count {
                newMember[i] = newMember[i] + Int.random(in: -2 ... 2)
            }
            if newMember != correctPitchClassArray {
                aberrations.insert(newMember)
            }
        }
        
        var stringArray = Array(aberrations).map( { pitchClassArray in
            formatPitchClassArray(pitchClassArray)
        })
        
        let correctAnswer = formatPitchClassArray(correctPitchClassArray)
        correctAnswerIndex = Int.random(in: 0 ..< 4)
        stringArray.insert(correctAnswer, at: correctAnswerIndex)
        
        answers = stringArray
    }
    
    var body: some View {
        VStack() {
            DescriptionText(text: Text("Select the set of notes in a ")
                                + Text("\(chord.name)").bold()
                                + Text(" chord."))
            MultipleChoice(answers: answers, correctAnswerIndex: correctAnswerIndex, exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)
            
            CheckButton(exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)
        }
    }
}

struct ChordMultipleChoiceExercise_Previews: PreviewProvider {
    
    static let chord = Chord(root: .c, chordType: .major)
    
    static var previews: some View {
        ZStack() {
            ColorPalette.blue
                .ignoresSafeArea()
            ChordMultipleChoiceExercise(chord: chord, exerciseState: .constant(.active), exerciseCorrect: .constant(false))
        }
    }
}

