//
//  OctaveIntroductionExercise.swift
//  SimpleMusicTheory
//
//  Created by John Watson on 1/30/21.
//

import SwiftUI

struct OctaveIntroductionExercise: View {
    @Binding var exerciseState: ExerciseState
    @Binding var exerciseCorrect: Bool
    
    @State var interacted = false
    
    var body: some View {
        VStack() {
            DescriptionText(text: Text("Due to mathy reasons, some harmonies are more ")
                                + Text("consonant").bold()
                                + Text(", some are more ")
                                + Text("dissonant").bold()
                                + Text(".\n\n")
                                
                                + Text("A 2 to 1 ratio, for example, is very consonant.\n\n")
                                + Text("We call this harmony an ")
                                + Text("octave").bold()
                                + Text("."))
            Spacer()
            PitchPlayerGroup(interacted: $interacted, exerciseState: $exerciseState, pitches: [400.0, 800.0])
            Spacer()
            
            ContinueButton(exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)
        }.onChange(of: interacted) { _ in
            exerciseState = .answered
        }
    }
}

struct OctaveIntroductionExercise_Previews: PreviewProvider {
    static var previews: some View {
        ZStack() {
            ColorPalette.blue
                .ignoresSafeArea()
            OctaveIntroductionExercise(exerciseState: .constant(.active), exerciseCorrect: .constant(false))
        }
    }
}
