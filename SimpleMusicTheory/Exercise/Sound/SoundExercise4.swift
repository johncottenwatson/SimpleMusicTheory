//
//  SoundExercise4.swift
//  SimpleMusicTheory
//
//  Created by John Watson on 1/26/21.
//

import SwiftUI

struct SoundExercise4: View {
    
    let period: Double = 30.0
    var waitTime: Double {
        return period / 4.0
    }
    
    @Binding var exerciseState: ExerciseState
    @Binding var exerciseCorrect: Bool
    
    var body: some View {
        VStack() {
            DescriptionText(text: Text("On the other hand, patterns that happen less than every 30 seconds or so are called ")
                                + Text("form").bold()
                                + Text("."))
            Spacer()
            FormWheel(exerciseState: $exerciseState, period: self.period)
            Spacer()
            
            ContinueButton(exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)
        }.onAppear() {
            DispatchQueue.main.asyncAfter(deadline: .now() + waitTime) {
                exerciseState = .answered
            }
        }
    }
}

struct SoundExercise4_Previews: PreviewProvider {
    static var previews: some View {
        ZStack() {
            ColorPalette.blue
                .ignoresSafeArea()
            SoundExercise4(exerciseState: .constant(.active), exerciseCorrect: .constant(false))
        }
    }
}

