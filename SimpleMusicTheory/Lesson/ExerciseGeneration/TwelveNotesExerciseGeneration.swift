//
//  TwelveNotesExerciseGeneration.swift
//  SimpleMusicTheory
//
//  Created by John Watson on 1/22/21.
//

import SwiftUI

extension LessonView {
    public func generate12NotesExercises() {
        // Special introductory lessons
        exercises.append(AnyView(HarmonyIntroductionExercise(exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        exercises.append(AnyView(OctaveIntroductionExercise(exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        exercises.append(AnyView(NoteIntroductionExercise(exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        exercises.append(AnyView(TwelveNotesIntroductionExercise(exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        endSection()
        exercises.append(AnyView(LetterNamesIntroductionExercise(exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        endSection()
        exercises.append(AnyView(SemitoneIntroductionExercise(exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        endSection()
        
        // PRACTICE SEMITONE GAPS
        // Already walked through C + 1, C# + 1; now, test C + 2 to connect the dots
        exercises.append(AnyView(SemitonesExercise(isFlatLayout: true, root: .c, semitoneGap: 2, exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        endSection()
        // What about 4 semitones above C?
        exercises.append(AnyView(SemitonesExercise(isFlatLayout: true, root: .c, semitoneGap: 4, exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        endSection()
        // Same progression, starting on E
        exercises.append(AnyView(SemitonesExercise(isFlatLayout: true, root: .e, semitoneGap: 1, exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        endSection()
        exercises.append(AnyView(SemitonesExercise(isFlatLayout: true, root: .f, semitoneGap: 1, exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        endSection()
        exercises.append(AnyView(SemitonesExercise(isFlatLayout: true, root: .e, semitoneGap: 2, exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        endSection()
        exercises.append(AnyView(SemitonesExercise(isFlatLayout: true, root: .e, semitoneGap: 4, exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        endSection()
        // Now try B + 1 to loop the circle
        exercises.append(AnyView(SemitonesExercise(isFlatLayout: true, root: .b, semitoneGap: 1, exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        endSection()
    
        // Introduce standard keyboard layout
        exercises.append(AnyView(StandardKeyboardIntroductionExercise(exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        endSection()
        
        // Already walked through C + 1; same progression as earlier, but on standard keyboard
        exercises.append(AnyView(SemitonesExercise(isFlatLayout: false, root: .cSharp, semitoneGap: 1, exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        endSection()
        exercises.append(AnyView(SemitonesExercise(isFlatLayout: false, root: .c, semitoneGap: 2, exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        endSection()
        // What about 4 semitones above C?
        exercises.append(AnyView(SemitonesExercise(isFlatLayout: false, root: .c, semitoneGap: 4, exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        endSection()
        // Same progression, starting on E
        exercises.append(AnyView(SemitonesExercise(isFlatLayout: false, root: .e, semitoneGap: 1, exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        endSection()
        exercises.append(AnyView(SemitonesExercise(isFlatLayout: false, root: .f, semitoneGap: 1, exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        endSection()
        exercises.append(AnyView(SemitonesExercise(isFlatLayout: false, root: .e, semitoneGap: 2, exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        endSection()
        exercises.append(AnyView(SemitonesExercise(isFlatLayout: false, root: .e, semitoneGap: 4, exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        endSection()
        
        // Harder practice of the same – multiple choice semitone gap problems (no keyboard for reference)
        exercises.append(AnyView(SemitonesMultipleChoiceExercise(root: .c, semitoneGap: 2, exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        endSection()
        exercises.append(AnyView(SemitonesMultipleChoiceExercise(root: .c, semitoneGap: 4, exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        endSection()
        exercises.append(AnyView(SemitonesMultipleChoiceExercise(root: .e, semitoneGap: 2, exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        endSection()
        exercises.append(AnyView(SemitonesMultipleChoiceExercise(root: .e, semitoneGap: 4, exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        endSection()
        
        // 2 random semitone gaps (standard)
        var gaps1: Set<Int> = []
        while gaps1.count < 2 {
            gaps1.insert(Int.random(in: 1 ... 7) * (Bool.random() ? -1 : 1))
        }
        for gap in gaps1 {
            let root = PitchClass.random()
            exercises.append(AnyView(SemitonesExercise(isFlatLayout: false, root: root, semitoneGap: gap, exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        }
        endSection()
        
        // 2 random semitone gaps (multiple choice)
        var gaps2: Set<Int> = []
        while gaps2.count < 2 {
            gaps2.insert(Int.random(in: 1 ... 7) * (Bool.random() ? -1 : 1))
        }
        for gap in gaps2 {
            let root = PitchClass.random()
            exercises.append(AnyView(SemitonesExercise(isFlatLayout: false, root: root, semitoneGap: gap, exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        }
        endSection()
    }
}
