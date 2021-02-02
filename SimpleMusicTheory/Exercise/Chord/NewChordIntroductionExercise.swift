//
//  NewChordIntroductionExercise.swift
//  SimpleMusicTheory
//
//  Created by John Watson on 1/31/21.
//

import SwiftUI

struct NewChordIntroductionExercise: View {

    let waitTime = 2.0
    
    let chordType: ChordType
    @State var root: PitchClass = .c
    
    @Binding var exerciseState: ExerciseState
    @Binding var exerciseCorrect: Bool
    
    var body: some View {
        VStack() {
            DescriptionText(text: Text("A ")
                                + Text("\(chordType.longName) chord").bold()
                                + Text(" is \(chordType.description).\n\n")
                                + Text(chordType.remarkSentence != nil ? "\(chordType.remarkSentence!)\n\n" : "")
                                + Text("The formula for a \(chordType.longName) chord is ")
                                + Text("\(chordType.intervalsString)").bold()
                                + Text("."))
            Spacer()
            chordMenu
            Spacer()
            
            ContinueButton(exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)
        }.onAppear() {
            DispatchQueue.main.asyncAfter(deadline: .now() + waitTime) {
                exerciseState = .answered
            }
        }.onChange(of: exerciseState) { newState in
            if exerciseState == .closing {
                exerciseState = .completed
            }
        }
    }
    
    var chordMenu: some View {
        Picker("", selection: $root) {
            ForEach(PitchClass.allCases, id: \.self) { pitchClass in
                HStack() {
                    ForEach(chordType.intervals, id: \.self) { interval in
                        Text("\((pitchClass + interval).name)")
                            .font(.system(.largeTitle, design: .rounded))
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .foregroundColor(ColorPalette.white)
                            .frame(width: 50.0, height: 30.0, alignment: .leading)
                    }
                }
            }
        }.frame(height: 60.0)
    }
}

struct NewChordIntroductionExercise_Previews: PreviewProvider {

    static let chordType: ChordType = .major
    
    static var previews: some View {
        ZStack() {
            ColorPalette.blue
                .ignoresSafeArea()
            NewChordIntroductionExercise(chordType: chordType, exerciseState: .constant(.active), exerciseCorrect: .constant(false))
        }
    }
}
