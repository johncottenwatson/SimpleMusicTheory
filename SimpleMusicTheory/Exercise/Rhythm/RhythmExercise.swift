//
//  RhythmExercise.swift
//  SimpleMusicTheory
//
//  Created by John Watson on 1/25/21.
//

import SwiftUI

struct RhythmExercise: View {
    
    let shakerRhythm: Rhythm
    let woodblockRhythm: Rhythm?

    @Binding var exerciseState: ExerciseState
    @Binding var exerciseCorrect: Bool
    @State var shakerBeatsSelected: [Bool]
    @State var woodblockBeatsSelected: [Bool]
    
    init(shakerRhythm: Rhythm, woodblockRhythm: Rhythm?, exerciseState: Binding<ExerciseState>, exerciseCorrect: Binding<Bool>) {
        self.shakerRhythm = shakerRhythm
        self.woodblockRhythm = woodblockRhythm
        self._exerciseState = exerciseState
        self._exerciseCorrect = exerciseCorrect
        
        _shakerBeatsSelected = State(initialValue: Array(repeating: false, count: shakerRhythm.numBeats))
        _woodblockBeatsSelected = State(initialValue: Array(repeating: false, count: shakerRhythm.numBeats))
    }

    var body: some View {
        VStack() {
            DescriptionText(text: Text("Select the beats that the shaker\(woodblockRhythm != nil ? " and woodblock fall" : " falls") on."))
            RhythmKit(exerciseState: $exerciseState, shakerRhythm: shakerRhythm, woodblockRhythm: woodblockRhythm, shakerBeatsSelected: $shakerBeatsSelected, woodblockBeatsSelected: $woodblockBeatsSelected)
            Spacer()
            
            CheckButton(exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)
        }.onChange(of: exerciseState) { newState in
            if newState == .checking {
                let shakersCorrect = shakerBeatsSelected.elementsEqual(shakerRhythm.beats)
                let clavesCorrect = (woodblockRhythm == nil) || woodblockBeatsSelected.elementsEqual(woodblockRhythm!.beats)
                
                exerciseCorrect =  shakersCorrect && clavesCorrect
                exerciseState = .answered
            }
        }
    }
}

struct RhythmExercise_Previews: PreviewProvider {

    static let shakerRhythm = Rhythm(tempo: 120, numBeats: 4, beats: [true, false, true, false])

    static var previews: some View {
        ZStack() {
            ColorPalette.blue
                .ignoresSafeArea()
            RhythmExercise(shakerRhythm: shakerRhythm, woodblockRhythm: nil, exerciseState: .constant(.active), exerciseCorrect: .constant(false))
        }
    }
}
