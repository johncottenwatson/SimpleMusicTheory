//
//  Chord4ExerciseGeneration.swift
//  SimpleMusicTheory
//
//  Created by John Watson on 1/22/21.
//

import SwiftUI

extension LessonView {
    public func generateChord4Exercises() {
        // Introduce diminished chord type
        exercises.append(AnyView(NewChordIntroductionExercise(chordType: .diminished, exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))

        // Practice diminished 4 times
        exercises.append(AnyView(ChordExercise(isFlatLayout: false, chord: Chord(root: .c, chordType: .diminished), exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        exercises.append(AnyView(ChordExercise(isFlatLayout: false, chord: Chord(root: .e, chordType: .diminished), exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        exercises.append(AnyView(ChordExercise(isFlatLayout: false, chord: Chord(root: .gSharp, chordType: .diminished), exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        exercises.append(AnyView(ChordExercise(isFlatLayout: false, chord: Chord(root: .d, chordType: .diminished), exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        endSection()
        
        // Introduce augmented chord type
        exercises.append(AnyView(NewChordIntroductionExercise(chordType: .augmented, exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        
        // Practice augmented second 4 times
        exercises.append(AnyView(ChordExercise(isFlatLayout: false, chord: Chord(root: .c, chordType: .augmented), exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        exercises.append(AnyView(ChordExercise(isFlatLayout: false, chord: Chord(root: .a, chordType: .augmented), exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        exercises.append(AnyView(ChordExercise(isFlatLayout: false, chord: Chord(root: .fSharp, chordType: .augmented), exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        exercises.append(AnyView(ChordExercise(isFlatLayout: false, chord: Chord(root: .dSharp, chordType: .augmented), exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        endSection()
        
        // Introduce sixth chord type
        exercises.append(AnyView(NewChordIntroductionExercise(chordType: .sixth, exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        
        // Practice sixth 4 times
        exercises.append(AnyView(ChordExercise(isFlatLayout: false, chord: Chord(root: .c, chordType: .sixth), exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        exercises.append(AnyView(ChordExercise(isFlatLayout: false, chord: Chord(root: .f, chordType: .sixth), exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        exercises.append(AnyView(ChordExercise(isFlatLayout: false, chord: Chord(root: .a, chordType: .sixth), exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        exercises.append(AnyView(ChordExercise(isFlatLayout: false, chord: Chord(root: .dSharp, chordType: .sixth), exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        endSection()
        
        // Assorted multiple choice
        let legalChordTypes: Set<ChordType> = [.major, .minor, .majorSeventh, .minorSeventh, .dominantSeventh, .suspendedSecond, .suspendedFourth, .diminished, .augmented, .sixth]
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
