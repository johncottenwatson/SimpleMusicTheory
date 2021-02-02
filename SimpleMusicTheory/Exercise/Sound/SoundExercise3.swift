//
//  SoundExercise3.swift
//  SimpleMusicTheory
//
//  Created by John Watson on 1/28/21.
//

import SwiftUI

struct SoundExercise3: View {
    
    @Binding var exerciseState: ExerciseState
    @Binding var exerciseCorrect: Bool
    
    var body: some View {
        VStack() {
            DescriptionText(text: Text("When we hear patterns that happen more than 20 or so times per second, we perceive them as ")
                                + Text("pitch").bold()
                                + Text(".\n\n")
                                + Text("Move the slider to the right until the rhythm turns into a pitch."))
            Spacer()
            RhythmToPitchSlider(exerciseState: $exerciseState)
            Spacer()
            
            ContinueButton(exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)
        }
    }
}

struct SoundExercise3_Previews: PreviewProvider {
    static var previews: some View {
        ZStack() {
            ColorPalette.blue
                .ignoresSafeArea()
            SoundExercise3(exerciseState: .constant(.active), exerciseCorrect: .constant(false))
        }
    }
}
