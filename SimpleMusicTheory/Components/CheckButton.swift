//
//  CheckButton.swift
//  Sono
//
//  Created by John Watson on 1/12/21.
//

import SwiftUI

struct CheckButton: View {
    
    @Binding var exerciseState: ExerciseState
    @Binding var exerciseCorrect: Bool
    
    var body: some View {
        if exerciseState < .answered {
            Button(action: {
                if exerciseState == .active {
                    exerciseState = .checking
                }
            }) {
                ZStack() {
                    Capsule()
                        .foregroundColor(ColorPalette.darkBlue)
                    Text("Check")
                        .font(.system(.title2, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(ColorPalette.white)
                }
            }
            .frame(height: 60)
            .padding()
        } else {
            Button(action: {
                if exerciseState == .answered {
                    exerciseState = .closing
                }
            }) {
                ZStack() {
                    Capsule()
                        .foregroundColor(exerciseCorrect ? ColorPalette.green : ColorPalette.pink)
                    Text("Continue")
                        .font(.system(.title2, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(ColorPalette.white)
                }
            }
            .frame(height: 60)
            .padding()
        }
    }
}

struct CheckButton_Previews: PreviewProvider {
    static var previews: some View {
        ZStack() {
            ColorPalette.blue
                .ignoresSafeArea()
            CheckButton(exerciseState: .constant(.active), exerciseCorrect: .constant(false))
        }
    }
}
