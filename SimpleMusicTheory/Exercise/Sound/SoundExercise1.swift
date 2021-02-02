//
//  SoundExercise1.swift
//  Sono
//
//  Created by John Watson on 1/14/21.
//

import SwiftUI

struct SoundExercise1: View {

    let period = 0.5
    let waitTime = 4.0
    
    @Binding var exerciseState: ExerciseState
    @Binding var exerciseCorrect: Bool
    
    var body: some View {
        VStack() {
            DescriptionText(text: Text("Music is just ")
                                + Text("patterns ").bold()
                                + Text("made out of sound.\n\nHere’s a really simple pattern – a beat two times per second."))
            Spacer()
            Metronome(exerciseState: $exerciseState, period: period, numBeats: nil)
            Spacer()
            
            ContinueButton(exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)
        }.onAppear() {
            DispatchQueue.main.asyncAfter(deadline: .now() + waitTime) {
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
            SoundExercise1(exerciseState: .constant(.active), exerciseCorrect: .constant(false))
        }
    }
}
