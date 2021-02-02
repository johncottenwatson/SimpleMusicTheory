//
//  NewScaleIntroductionExercise.swift
//  SimpleMusicTheory
//
//  Created by John Watson on 2/1/21.
//

import SwiftUI

struct NewScaleIntroductionExercise: View {

    let waitTime = 2.0
    
    let scaleType: ScaleType
    @State var root: PitchClass = .c
    
    @Binding var exerciseState: ExerciseState
    @Binding var exerciseCorrect: Bool
    
    var body: some View {
        VStack() {
            DescriptionText(text: Text("A ")
                                + Text("\(scaleType.name) scale").bold()
                                + Text(" is \(scaleType.description).\n\n")
                                + Text(scaleType.remarkSentence != nil ? "\(scaleType.remarkSentence!)\n\n" : "")
                                + Text("The formula for a \(scaleType.name) scale is ")
                                + Text("\(scaleType.intervalsString)").bold()
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
                    ForEach(scaleType.intervals, id: \.self) { interval in
                        Text("\((pitchClass + interval).name)")
                            .font(.system(.title, design: .rounded))
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .foregroundColor(ColorPalette.white)
                            .frame(minWidth: 38.0, minHeight: 30.0, alignment: .leading)
                    }
                }
            }
        }.frame(height: 60.0)
    }
}

struct NewScaleIntroductionExercise_Previews: PreviewProvider {

    static let scaleType: ScaleType = .harmonicMinor
    
    static var previews: some View {
        ZStack() {
            ColorPalette.blue
                .ignoresSafeArea()
            NewScaleIntroductionExercise(scaleType: scaleType, exerciseState: .constant(.active), exerciseCorrect: .constant(false))
        }
    }
}
