//
//  ContinueButton.swift
//  Sono
//
//  Created by John Watson on 1/7/21.
//

import SwiftUI

struct ContinueButton: View {
    
    @Binding var exerciseState: ExerciseState
    @Binding var exerciseCorrect: Bool
    
    var body: some View {
        Button(action: {
            exerciseCorrect = true
            exerciseState = .closing
        }) {
            ZStack() {
                Capsule()
                    .foregroundColor(ColorPalette.darkBlue)
                Text("Continue")
                    .font(.system(.title2, design: .rounded))
                    .fontWeight(.bold)
                    .foregroundColor(ColorPalette.white)
            }
        }
        .frame(height: 60)
        .padding()
        .opacity(exerciseState < .answered ? 0 : 1)
        .disabled(exerciseState < .answered)
    }
}

struct ContinueButton_Previews: PreviewProvider {
    static var previews: some View {
        ZStack() {
            ColorPalette.blue
                .ignoresSafeArea()
            ContinueButton(exerciseState: .constant(.active), exerciseCorrect: .constant(false))
        }
    }
}
