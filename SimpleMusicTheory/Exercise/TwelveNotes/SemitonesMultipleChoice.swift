//
//  SemitonesMultipleChoice.swift
//  SimpleMusicTheory
//
//  Created by John Watson on 2/9/21.
//

import SwiftUI

struct SemitonesMultipleChoiceExercise: View {

    let root: PitchClass
    let semitoneGap: Int
    
    @Binding var exerciseState: ExerciseState
    @Binding var exerciseCorrect: Bool
    
    let answers: [String]
    let correctAnswerIndex: Int
    
    init(root: PitchClass, semitoneGap: Int, exerciseState: Binding<ExerciseState>, exerciseCorrect: Binding<Bool>) {
        self.root = root
        self.semitoneGap = semitoneGap
        self._exerciseState = exerciseState
        self._exerciseCorrect = exerciseCorrect
        let correctPitchClass = root + semitoneGap
        var aberrations: Set<PitchClass> = []
        while aberrations.count < 3 {
            var newMember = correctPitchClass
            newMember = newMember + Int.random(in: -2 ... 2)
            if newMember != correctPitchClass && newMember != root {
                aberrations.insert(newMember)
            }
        }
        
        var stringArray = Array(aberrations).map( { pitchClass in
            pitchClass.name
        })
        
        let correctAnswer = correctPitchClass.name
        correctAnswerIndex = Int.random(in: 0 ..< 4)
        stringArray.insert(correctAnswer, at: correctAnswerIndex)
        
        answers = stringArray
    }
    
    var body: some View {
        VStack() {
            DescriptionText(text: Text("What note is ")
                                + Text("\(semitoneGap)").bold()
                                + Text(" semitones above ")
                                + Text("\(root.name)").bold()
                                + Text("?"))
            MultipleChoice(answers: answers, correctAnswerIndex: correctAnswerIndex, exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)
            
            CheckButton(exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)
        }
    }
}

struct SemitonesMultipleChoiceExercise_Previews: PreviewProvider {
    static let root: PitchClass = .c
    static let semitoneGap = 1
    
    static var previews: some View {
        ZStack() {
            ColorPalette.blue
                .ignoresSafeArea()
            SemitonesMultipleChoiceExercise(root: root, semitoneGap: semitoneGap, exerciseState: .constant(.active), exerciseCorrect: .constant(false))
        }
    }
}


