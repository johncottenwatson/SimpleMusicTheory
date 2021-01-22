//
//  SoundExercise.swift
//  Sono
//
//  Created by John Watson on 1/14/21.
//

import SwiftUI

struct SoundExercise1: View {

    let exerciseNum: Int
    
    @Binding var exerciseState: ExerciseState
    @Binding var exerciseCorrect: Bool
    
    var body: some View {
        VStack() {
            DescriptionText(text: Text("Music is just sound patterns.\n\nHere’s a really simple pattern – a beat two times per second."))
            Spacer()
            Metronome(exerciseState: $exerciseState, period: 0.5)
            Spacer()
            
            ContinueButton(exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)
        }.onChange(of: exerciseState) { newState in
            if newState == .checking {
                exerciseCorrect = true
                exerciseState = .answered
            }
        }
    }
}

struct SoundExercise1_Previews: PreviewProvider {
    static var previews: some View {
        ZStack() {
            ColorPalette.blue
                .ignoresSafeArea()
            SoundExercise1(exerciseNum: 0, exerciseState: .constant(.active), exerciseCorrect: .constant(false))
        }
    }
}

