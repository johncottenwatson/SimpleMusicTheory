//
//  Chord3ExerciseGeneration.swift
//  SimpleMusicTheory
//
//  Created by John Watson on 1/22/21.
//

import SwiftUI

extension LessonView {
    public func generateChord3Exercises() {
        // Introduce dominant seventh chord type
        exercises.append(AnyView(NewChordIntroductionExercise(chordType: .dominantSeventh, exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))

        // Practice dominant seventh 4 times
        exercises.append(AnyView(ChordExercise(isFlatLayout: false, chord: Chord(root: .c, chordType: .dominantSeventh), exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        exercises.append(AnyView(ChordExercise(isFlatLayout: false, chord: Chord(root: .g, chordType: .dominantSeventh), exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        exercises.append(AnyView(ChordExercise(isFlatLayout: false, chord: Chord(root: .b, chordType: .dominantSeventh), exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        exercises.append(AnyView(ChordExercise(isFlatLayout: false, chord: Chord(root: .fSharp, chordType: .dominantSeventh), exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        endSection()
        
        // Introduce suspended second chord type
        exercises.append(AnyView(NewChordIntroductionExercise(chordType: .suspendedSecond, exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        
        // Practice suspended second 4 times
        exercises.append(AnyView(ChordExercise(isFlatLayout: false, chord: Chord(root: .c, chordType: .suspendedSecond), exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        exercises.append(AnyView(ChordExercise(isFlatLayout: false, chord: Chord(root: .b, chordType: .suspendedSecond), exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        exercises.append(AnyView(ChordExercise(isFlatLayout: false, chord: Chord(root: .aSharp, chordType: .suspendedSecond), exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        exercises.append(AnyView(ChordExercise(isFlatLayout: false, chord: Chord(root: .a, chordType: .suspendedSecond), exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        endSection()
        
        // Introduce suspended fourth chord type
        exercises.append(AnyView(NewChordIntroductionExercise(chordType: .suspendedSecond, exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        
        // Practice suspended fourth 4 times
        exercises.append(AnyView(ChordExercise(isFlatLayout: false, chord: Chord(root: .c, chordType: .suspendedFourth), exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        exercises.append(AnyView(ChordExercise(isFlatLayout: false, chord: Chord(root: .b, chordType: .suspendedFourth), exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        exercises.append(AnyView(ChordExercise(isFlatLayout: false, chord: Chord(root: .aSharp, chordType: .suspendedFourth), exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        exercises.append(AnyView(ChordExercise(isFlatLayout: false, chord: Chord(root: .a, chordType: .suspendedFourth), exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        endSection()
        
        // Assorted multiple choice
        let legalChordTypes: Set<ChordType> = [.major, .minor, .majorSeventh, .minorSeventh, .dominantSeventh, .suspendedSecond, .suspendedFourth]
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
