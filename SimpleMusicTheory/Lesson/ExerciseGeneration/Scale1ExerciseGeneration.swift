//
//  Scale1ExerciseGeneration.swift
//  SimpleMusicTheory
//
//  Created by John Watson on 1/22/21.
//

import SwiftUI

extension LessonView {
    public func generateScale1Exercises() {
        // Introduce scales
        exercises.append(AnyView(ScaleIntroductionExercise(exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        
        // Introduce pentatonic scale
        exercises.append(AnyView(NewScaleIntroductionExercise(scaleType: .pentatonic, exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        
        // Practice pentatonic scale 4 times
        exercises.append(AnyView(ScaleExercise(isFlatLayout: false, scale: Scale(root: .c, scaleType: .pentatonic), exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        exercises.append(AnyView(ScaleExercise(isFlatLayout: false, scale: Scale(root: .f, scaleType: .pentatonic), exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        exercises.append(AnyView(ScaleExercise(isFlatLayout: false, scale: Scale(root: .a, scaleType: .pentatonic), exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        exercises.append(AnyView(ScaleExercise(isFlatLayout: false, scale: Scale(root: .d, scaleType: .pentatonic), exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        endSection()
        
        // Introduce major scale
        exercises.append(AnyView(NewScaleIntroductionExercise(scaleType: .major, exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        
        // Practice major scale by walking through every key, stepping by fifths
        var pitchClass: PitchClass = .c
        for _ in 0 ..< PitchClass.numPitchClasses {
            exercises.append(AnyView(ScaleExercise(isFlatLayout: false, scale: Scale(root: pitchClass, scaleType: .major), exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
            pitchClass = pitchClass + 7
        }
        endSection()
    }
}
