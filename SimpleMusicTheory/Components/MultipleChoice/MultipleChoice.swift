//
//  MultipleChoice.swift
//  SimpleMusicTheory
//
//  Created by John Watson on 2/1/21.
//

import SwiftUI

struct MultipleChoice: View {
    let answers: [String]
    let correctAnswerIndex: Int
    
    @Binding var exerciseState: ExerciseState
    @Binding var exerciseCorrect: Bool
    @State var selectedAnswerIndex: Int?
    
    var body: some View {
        VStack() {
            HStack() {
                MultipleChoiceSquare(index: 0, answer: answers[0], correctAnswerIndex: correctAnswerIndex, exerciseState: $exerciseState, selectedAnswerIndex: $selectedAnswerIndex)
                MultipleChoiceSquare(index: 1, answer: answers[1], correctAnswerIndex: correctAnswerIndex, exerciseState: $exerciseState, selectedAnswerIndex: $selectedAnswerIndex)
            }
            HStack() {
                MultipleChoiceSquare(index: 2, answer: answers[2], correctAnswerIndex: correctAnswerIndex, exerciseState: $exerciseState, selectedAnswerIndex: $selectedAnswerIndex)
                MultipleChoiceSquare(index: 3, answer: answers[3], correctAnswerIndex: correctAnswerIndex, exerciseState: $exerciseState, selectedAnswerIndex: $selectedAnswerIndex)
            }
        }.disabled(exerciseState != .active)
        .padding(.all, 5.0)
        .onChange(of: exerciseState) { newState in
            if newState == .checking {
                exerciseCorrect = selectedAnswerIndex == correctAnswerIndex
                exerciseState = .answered
            } else if exerciseState == .closing {
                exerciseState = .completed
            }
        }
    }
}

struct MultipleChoice_Previews: PreviewProvider {
    static let answers = ["E A C", "E G# B", "E F C", "E F A"]
    static let correctAnswerIndex = 2
    
    static var previews: some View {
        ZStack() {
            ColorPalette.blue
                .ignoresSafeArea()
            MultipleChoice(answers: answers, correctAnswerIndex: correctAnswerIndex, exerciseState: .constant(.active), exerciseCorrect: .constant(false))
        }
    }
}

