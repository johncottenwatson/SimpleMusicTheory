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

        // Practice C major chord, reviewing constituent semitone gaps
        exercises.append(AnyView(SemitonesExercise(isFlatLayout: false, root: .c, semitoneGap: 0, exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        endSection()
        exercises.append(AnyView(SemitonesExercise(isFlatLayout: false, root: .c, semitoneGap: 4, exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        endSection()
        exercises.append(AnyView(SemitonesExercise(isFlatLayout: false, root: .c, semitoneGap: 7, exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        endSection()
        exercises.append(AnyView(ChordExercise(isFlatLayout: false, chord: Chord(root: .c, chordType: .major), exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        endSection()
        
        // Practice D major chord, reviewing constituent semitone gaps
        exercises.append(AnyView(SemitonesExercise(isFlatLayout: false, root: .d, semitoneGap: 0, exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        endSection()
        exercises.append(AnyView(SemitonesExercise(isFlatLayout: false, root: .d, semitoneGap: 4, exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        endSection()
        exercises.append(AnyView(SemitonesExercise(isFlatLayout: false, root: .d, semitoneGap: 7, exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        endSection()
        exercises.append(AnyView(ChordExercise(isFlatLayout: false, chord: Chord(root: .d, chordType: .major), exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        endSection()

        // Introduce minor chord type
        exercises.append(AnyView(NewChordIntroductionExercise(chordType: .minor, exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        
        // Practice Cm chord, reviewing constituent semitone gaps
        exercises.append(AnyView(SemitonesMultipleChoiceExercise(root: .c, semitoneGap: 0, exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        endSection()
        exercises.append(AnyView(SemitonesMultipleChoiceExercise(root: .c, semitoneGap: 3, exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        endSection()
        exercises.append(AnyView(SemitonesMultipleChoiceExercise(root: .c, semitoneGap: 7, exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        endSection()
        exercises.append(AnyView(ChordExercise(isFlatLayout: false, chord: Chord(root: .c, chordType: .minor), exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        endSection()
        
        // Practice G#m chord, reviewing constituent semitone gaps
        exercises.append(AnyView(SemitonesMultipleChoiceExercise(root: .gSharp, semitoneGap: 0, exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        endSection()
        exercises.append(AnyView(SemitonesMultipleChoiceExercise(root: .gSharp, semitoneGap: 3, exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        endSection()
        exercises.append(AnyView(SemitonesMultipleChoiceExercise(root: .gSharp, semitoneGap: 7, exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        endSection()
        exercises.append(AnyView(ChordExercise(isFlatLayout: false, chord: Chord(root: .gSharp, chordType: .minor), exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
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
