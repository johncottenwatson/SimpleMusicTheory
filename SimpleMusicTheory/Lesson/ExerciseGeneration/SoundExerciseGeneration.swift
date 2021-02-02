//
//  SoundExerciseGeneration.swift
//  SimpleMusicTheory
//
//  Created by John Watson on 1/22/21.
//

import SwiftUI

extension LessonView {
    public func generateSoundExercises() {
        exercises.append(AnyView(SoundExercise1(exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        exercises.append(AnyView(SoundExercise2(exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        exercises.append(AnyView(SoundExercise3(exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        exercises.append(AnyView(SoundExercise4(exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        exercises.append(AnyView(SoundExercise5(exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        endSection()
    }
}
