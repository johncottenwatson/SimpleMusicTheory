//
//  ExerciseGeneration.swift
//  Sono
//
//  Created by John Watson on 1/16/21.
//

import SwiftUI

extension LessonView {
    public func createExercises() {        
        switch(lesson) {
        // Row 1
        case .sound:
            exercises.append(AnyView(SoundExercise1(exerciseNum: 0, exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))

        // Row 2
        case .twelveNotes:
            exercises.append(AnyView(SemitonesExercise(exerciseNum: 0, isFlatLayout: true, root: .c, semitoneGap: 1, exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
            for index in 1...4 {
                let root = PitchClass.random()
                let semitoneGap = Int.random(in: 1..<8) * (Bool.random() ? -1 : 1)
                exercises.append(AnyView(SemitonesExercise(exerciseNum: index, isFlatLayout: true, root: root, semitoneGap: semitoneGap, exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
            }
            for index in 5...9 {
                let root = PitchClass.random()
                let semitoneGap = Int.random(in: 1..<(index > 7 ? 12 : 8)) * (Bool.random() ? -1 : 1)
                exercises.append(AnyView(SemitonesExercise(exerciseNum: index, isFlatLayout: false, root: root, semitoneGap: semitoneGap, exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
            }
        case .rhythm1:
            exercises.append(AnyView(SoundExercise1(exerciseNum: 0, exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
            
        // Row 3
        case .rhythm2:
            exercises.append(AnyView(SoundExercise1(exerciseNum: 0, exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        case .chord1:
            exercises.append(AnyView(ChordExercise(exerciseNum: 0, isFlatLayout: false, chord: Chord(root: .c, chordType: .major), exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
            for index in 1...2 {
                let root = PitchClass.random()
                let chordType = ChordType.major
                exercises.append(AnyView(ChordExercise(exerciseNum: index, isFlatLayout: false, chord: Chord(root: root, chordType: chordType), exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
            }
            exercises.append(AnyView(ChordExercise(exerciseNum: 3, isFlatLayout: false, chord: Chord(root: .c, chordType: .minor), exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
            for index in 4...5 {
                let root = PitchClass.random()
                let chordType = ChordType.minor
                exercises.append(AnyView(ChordExercise(exerciseNum: index, isFlatLayout: false, chord: Chord(root: root, chordType: chordType), exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
            }
            for index in 6...9 {
                let root = PitchClass.random()
                let chordType = Bool.random() ? ChordType.major : ChordType.minor
                exercises.append(AnyView(ChordExercise(exerciseNum: index, isFlatLayout: false, chord: Chord(root: root, chordType: chordType), exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
            }
            
        // Row 4
        case .chord2:
            exercises.append(AnyView(SoundExercise1(exerciseNum: 0, exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        case .scale1:
            exercises.append(AnyView(SoundExercise1(exerciseNum: 0, exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
            
        // Row 5
        case .chord3:
            exercises.append(AnyView(SoundExercise1(exerciseNum: 0, exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        case .rhythm3:
            exercises.append(AnyView(SoundExercise1(exerciseNum: 0, exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
            
        // Row 6
        case .scale2:
            exercises.append(AnyView(SoundExercise1(exerciseNum: 0, exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        case .chord4:
            exercises.append(AnyView(SoundExercise1(exerciseNum: 0, exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        }

        exerciseCount = exercises.count
        progressCount = exercises.count
    }
}
