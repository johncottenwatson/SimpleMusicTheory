//
//  Chord1ExerciseGeneration.swift
//  SimpleMusicTheory
//
//  Created by John Watson on 1/22/21.
//

import SwiftUI

extension LessonView {
    public func generateChord1Exercises() {
        // Introduce chords
        exercises.append(AnyView(ChordIntroductionExercise(exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))

        // Introduce major chord type
        exercises.append(AnyView(NewChordIntroductionExercise(chordType: .major, exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))

        // Practice major by walking through every major chromatically
        for pitchClass in PitchClass.allCases {
            exercises.append(AnyView(ChordExercise(isFlatLayout: false, chord: Chord(root: pitchClass, chordType: .major), exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        }
        endSection()

        // Introduce minor chord type
        exercises.append(AnyView(NewChordIntroductionExercise(chordType: .minor, exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        
        // Practice major seventh 4 times
        // Cm
        exercises.append(AnyView(ChordExercise(isFlatLayout: false, chord: Chord(root: .c, chordType: .minor), exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        // Em
        exercises.append(AnyView(ChordExercise(isFlatLayout: false, chord: Chord(root: .e, chordType: .minor), exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        // Gm
        exercises.append(AnyView(ChordExercise(isFlatLayout: false, chord: Chord(root: .g, chordType: .minor), exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        // A#m
        exercises.append(AnyView(ChordExercise(isFlatLayout: false, chord: Chord(root: .aSharp, chordType: .minor), exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        endSection()

        // Assorted multiple choice
        let legalChordTypes: Set<ChordType> = [.major, .minor]
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
