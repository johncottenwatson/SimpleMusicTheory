//
//  MultipleChoiceSquare.swift
//  SimpleMusicTheory
//
//  Created by John Watson on 2/1/21.
//

import Foundation

import SwiftUI

struct MultipleChoiceSquare: View {
    
    let index: Int
    let answer: String
    let correctAnswerIndex: Int
    
    @State var isSelected: Bool = false
    @Binding var exerciseState: ExerciseState
    @Binding var selectedAnswerIndex: Int?
    
    var body: some View {
        Button(action: {
            isSelected.toggle()
            if isSelected {
                selectedAnswerIndex = index
            } else {
                selectedAnswerIndex = nil
            }
        }) {
            ZStack() {
                Rectangle()
                    .foregroundColor(getRectangleColor(isSelected: isSelected, exerciseState: exerciseState))
                    .cornerRadius(20.0)
                Text(answer)
                    .font(.system(.title2, design: .rounded))
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundColor(getRectangleColor(isSelected: isSelected, exerciseState: exerciseState) == ColorPalette.white ? ColorPalette.darkBlue : ColorPalette.white)
            }
        }.padding(.all, 5.0)
        .onChange(of: selectedAnswerIndex) { _ in
            if isSelected && index != selectedAnswerIndex {
                isSelected = false
            }
        }
    }
    
    
    func getRectangleColor(isSelected: Bool, exerciseState: ExerciseState) -> Color {
        if exerciseState < .answered {
            if !isSelected {
                return ColorPalette.white
            } else {
                return ColorPalette.darkBlue
            }
        }
        if index == correctAnswerIndex {
            return ColorPalette.green
        } else if isSelected {
            return ColorPalette.pink
        }
        return ColorPalette.white
    }
}
