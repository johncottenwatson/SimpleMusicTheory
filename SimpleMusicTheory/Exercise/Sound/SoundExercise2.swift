//
//  SoundExercise2.swift
//  SimpleMusicTheory
//
//  Created by John Watson on 1/27/21.
//

import SwiftUI

struct SoundExercise2: View {
    
    @Binding var exerciseState: ExerciseState
    @Binding var exerciseCorrect: Bool
    
    var body: some View {
        VStack() {
            DescriptionText(text: Text("Patterns that happen a couple times per second to once every couple seconds are called ")
                                + Text("rhythm").bold()
                                + Text(".\n\n")
                                + Text("Move the slider to the right to speed up the rhythm."))
            Spacer()
            RhythmSlider(exerciseState: $exerciseState)
            Spacer()
            
            ContinueButton(exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)
        }
    }
}

struct SoundExercise2_Previews: PreviewProvider {
    static var previews: some View {
        ZStack() {
            ColorPalette.blue
                .ignoresSafeArea()
            SoundExercise2(exerciseState: .constant(.active), exerciseCorrect: .constant(false))
        }
    }
}
