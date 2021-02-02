//
//  Rhythm1ExerciseGeneration.swift
//  SimpleMusicTheory
//
//  Created by John Watson on 1/22/21.
//

import SwiftUI

extension LessonView {
    public func generateRhythm1Exercises() {
        
        let text = "One common way to think about rhythm is to split the basic beat into groups of 4 or 8."
        exercises.append(AnyView(NewBeatIntroductionExercise(text: text, numBeats: 4, exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        
        // BEAT PRACTICE
        var shakerRhythm: Rhythm
        var woodblockRhythm: Rhythm
        
        // 4 beat shaker
        shakerRhythm = Rhythm(tempo: 160, numBeats: 4, beats: [true, false, true, false])
        exercises.append(AnyView(RhythmExercise(shakerRhythm: shakerRhythm, woodblockRhythm: nil, exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        
        // 4 beat shaker + wood
        shakerRhythm = Rhythm(tempo: 180, numBeats: 4, beats: [true, true, false, false])
        woodblockRhythm = Rhythm(tempo: 180, numBeats: 4, beats: [false, false, true, true])
        exercises.append(AnyView(RhythmExercise(shakerRhythm: shakerRhythm, woodblockRhythm: woodblockRhythm, exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        endSection()
        
        // 8 beat shaker
        shakerRhythm = Rhythm(tempo: 220, numBeats: 8, beats: [true, false, false, true, false, false, true, false])
        exercises.append(AnyView(RhythmExercise(shakerRhythm: shakerRhythm, woodblockRhythm: nil, exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        
        // 8 beat shaker + wood
        shakerRhythm = Rhythm(tempo: 220, numBeats: 8, beats: [true, false, true, false, true, false, true, false])
        woodblockRhythm = Rhythm(tempo: 220, numBeats: 8, beats: [true, false, false, true, true, false, true, false])
        exercises.append(AnyView(RhythmExercise(shakerRhythm: shakerRhythm, woodblockRhythm: woodblockRhythm, exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        endSection()
    }
}
