//
//  Scale2ExerciseGeneration.swift
//  SimpleMusicTheory
//
//  Created by John Watson on 1/22/21.
//

import SwiftUI

extension LessonView {
    public func generateScale2Exercises() {
        // Introduce harmonic minor scale
        exercises.append(AnyView(NewScaleIntroductionExercise(scaleType: .harmonicMinor, exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        
        // Practice harmonic minor scale 4 times
        exercises.append(AnyView(ScaleExercise(isFlatLayout: false, scale: Scale(root: .c, scaleType: .harmonicMinor), exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        exercises.append(AnyView(ScaleExercise(isFlatLayout: false, scale: Scale(root: .a, scaleType: .harmonicMinor), exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        exercises.append(AnyView(ScaleExercise(isFlatLayout: false, scale: Scale(root: .b, scaleType: .harmonicMinor), exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        exercises.append(AnyView(ScaleExercise(isFlatLayout: false, scale: Scale(root: .d, scaleType: .harmonicMinor), exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        endSection()
        
        // Introduce whole tone scale
        exercises.append(AnyView(NewScaleIntroductionExercise(scaleType: .wholeTone, exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        
        // Practice whole tone scale 2 times
        exercises.append(AnyView(ScaleExercise(isFlatLayout: false, scale: Scale(root: .c, scaleType: .wholeTone), exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        exercises.append(AnyView(ScaleExercise(isFlatLayout: false, scale: Scale(root: .cSharp, scaleType: .wholeTone), exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        endSection()
    }
}
