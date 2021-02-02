//
//  SoundExercise5.swift
//  SimpleMusicTheory
//
//  Created by John Watson on 1/27/21.
//

import SwiftUI

struct SoundExercise5: View {
    
    let waitTime = 2.0
    
    @Binding var exerciseState: ExerciseState
    @Binding var exerciseCorrect: Bool
    
    var body: some View {
        VStack() {
            DescriptionText(text: Text("Most music has patterns on all three scales – ")
                                + Text("pitch").bold()
                                + Text(", ")
                                + Text("rhythm").bold()
                                + Text(", and ")
                                + Text("form").bold()
                                + Text("."))
            HertzSpectrum(exerciseState: $exerciseState)
                .padding(.vertical, 20)
            
            ContinueButton(exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)
        }.onAppear() {
            DispatchQueue.main.asyncAfter(deadline: .now() + waitTime) {
                exerciseState = .answered
            }
        }
    }
}

struct SoundExercise5_Previews: PreviewProvider {
    static var previews: some View {
        ZStack() {
            ColorPalette.blue
                .ignoresSafeArea()
            SoundExercise5(exerciseState: .constant(.active), exerciseCorrect: .constant(false))
        }
    }
}

