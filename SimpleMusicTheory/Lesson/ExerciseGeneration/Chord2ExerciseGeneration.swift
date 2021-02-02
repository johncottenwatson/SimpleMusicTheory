//
//  Chord2ExerciseGeneration.swift
//  SimpleMusicTheory
//
//  Created by John Watson on 1/22/21.
//

import SwiftUI

extension LessonView {
    public func generateChord2Exercises() {
        // Introduce major seventh chord type
        exercises.append(AnyView(NewChordIntroductionExercise(chordType: .majorSeventh, exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))

        // Practice major seventh 4 times
        exercises.append(AnyView(ChordExercise(isFlatLayout: false, chord: Chord(root: .c, chordType: .majorSeventh), exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        exercises.append(AnyView(ChordExercise(isFlatLayout: false, chord: Chord(root: .d, chordType: .majorSeventh), exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        exercises.append(AnyView(ChordExercise(isFlatLayout: false, chord: Chord(root: .f, chordType: .majorSeventh), exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        exercises.append(AnyView(ChordExercise(isFlatLayout: false, chord: Chord(root: .gSharp, chordType: .majorSeventh), exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        endSection()
        
        // Introduce minor seventh chord type
        exercises.append(AnyView(NewChordIntroductionExercise(chordType: .minorSeventh, exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        
        // Practice major seventh 4 times
        exercises.append(AnyView(ChordExercise(isFlatLayout: false, chord: Chord(root: .a, chordType: .minorSeventh), exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        exercises.append(AnyView(ChordExercise(isFlatLayout: false, chord: Chord(root: .b, chordType: .minorSeventh), exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        exercises.append(AnyView(ChordExercise(isFlatLayout: false, chord: Chord(root: .d, chordType: .minorSeventh), exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        exercises.append(AnyView(ChordExercise(isFlatLayout: false, chord: Chord(root: .f, chordType: .minorSeventh), exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        endSection()
        
        // Assorted multiple choice
        let legalChordTypes: Set<ChordType> = [.major, .minor, .majorSeventh, .minorSeventh]
        var chords: Set<Chord> = []
        while chords.count < 5 {
            chords.insert( Chord.random(legalChordTypes: legalChordTypes)
            )
        }
        for chord in chords {
            exercises.append(AnyView(ChordMultipleChoiceExercise(chord: chord, exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        }
        endSection()
    }
}
