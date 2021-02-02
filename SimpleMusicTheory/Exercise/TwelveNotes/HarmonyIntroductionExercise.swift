//
//  HarmonyIntroductionExercise.swift
//  SimpleMusicTheory
//
//  Created by John Watson on 1/30/21.
//

import SwiftUI

struct HarmonyIntroductionExercise: View {
    
    @Binding var exerciseState: ExerciseState
    @Binding var exerciseCorrect: Bool
    
    @State var moved = false
    
    var body: some View {
        VStack() {
            DescriptionText(text: Text("Multiple pitches played at the same time produce a ")
                                + Text("harmony").bold()
                                + Text(" based on the ratio of the two pitches."))
            Spacer()
            HarmonySliderPair(exerciseState: $exerciseState, moved: $moved)
            
            ContinueButton(exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)
        }.onChange(of: moved) { _ in
            exerciseState = .answered
        }
    }
}

struct HarmonyIntroductionExercise_Previews: PreviewProvider {
    static var previews: some View {
        ZStack() {
            ColorPalette.blue
                .ignoresSafeArea()
            HarmonyIntroductionExercise(exerciseState: .constant(.active), exerciseCorrect: .constant(false))
        }
    }
}
