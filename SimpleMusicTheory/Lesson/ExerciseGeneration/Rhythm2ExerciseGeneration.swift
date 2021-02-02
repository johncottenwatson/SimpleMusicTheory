//
//  Rhythm2ExerciseGeneration.swift
//  SimpleMusicTheory
//
//  Created by John Watson on 1/22/21.
//

import SwiftUI

extension LessonView {
    public func generateRhythm2Exercises() {
        
        let text = "Another common way to think about rhythm is to split the basic beat into groups of 3 or 6 or 12."
        exercises.append(AnyView(NewBeatIntroductionExercise(text: text, numBeats: 6, exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        
        // BEAT PRACTICE
        var shakerRhythm: Rhythm
        var woodblockRhythm: Rhythm
        
        // 6 beat shaker
        shakerRhythm = Rhythm(tempo: 220, numBeats: 6, beats: [true, false, false, true, true, false])
        exercises.append(AnyView(RhythmExercise(shakerRhythm: shakerRhythm, woodblockRhythm: nil, exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        
        // 6 beat shaker + wood
        shakerRhythm = Rhythm(tempo: 220, numBeats: 6, beats: [true, false, true, false, true, false])
        woodblockRhythm = Rhythm(tempo: 220, numBeats: 6, beats: [true, false, false, true, false, false])
        exercises.append(AnyView(RhythmExercise(shakerRhythm: shakerRhythm, woodblockRhythm: woodblockRhythm, exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        endSection()
        
        let t = true
        let f = false
        
        // 12 beat shaker
        shakerRhythm = Rhythm(tempo: 240, numBeats: 12, beats: [t, f, f, t, f, f, t, f, t, f, t, f])
        exercises.append(AnyView(RhythmExercise(shakerRhythm: shakerRhythm, woodblockRhythm: nil, exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        
        // 12 beat shaker + wood
        shakerRhythm = Rhythm(tempo: 240, numBeats: 12, beats: [t, f, t, f, t, f, t, f, t, f, t, f])
        woodblockRhythm = Rhythm(tempo: 240, numBeats: 12, beats: [t, f, f, t, f, t, f, f, t, f, t, f])
        exercises.append(AnyView(RhythmExercise(shakerRhythm: shakerRhythm, woodblockRhythm: woodblockRhythm, exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        endSection()
    }
}
