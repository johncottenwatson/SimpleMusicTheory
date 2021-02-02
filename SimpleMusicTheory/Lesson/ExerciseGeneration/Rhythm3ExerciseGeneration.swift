//
//  Rhythm3ExerciseGeneration.swift
//  SimpleMusicTheory
//
//  Created by John Watson on 1/22/21.
//

import SwiftUI

extension LessonView {
    public func generateRhythm3Exercises() {
        let text = "You can think about rhythms as being in groups of any number, really. Here’s a rhythm in groups of 5."
        exercises.append(AnyView(NewBeatIntroductionExercise(text: text, numBeats: 5, exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        
        // BEAT PRACTICE
        var shakerRhythm: Rhythm
        var woodblockRhythm: Rhythm
        
        let t = true
        let f = false
        
        // 5 beat shaker
        shakerRhythm = Rhythm(tempo: 220, numBeats: 5, beats: [true, false, false, true, false])
        exercises.append(AnyView(RhythmExercise(shakerRhythm: shakerRhythm, woodblockRhythm: nil, exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        
        // 10 beat shaker
        shakerRhythm = Rhythm(tempo: 220, numBeats: 10, beats: [t, f, f, t, f, f, t, f, t, f])
        exercises.append(AnyView(RhythmExercise(shakerRhythm: shakerRhythm, woodblockRhythm: nil, exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        
        // 10 beat shaker + wood
        shakerRhythm = Rhythm(tempo: 220, numBeats: 10, beats: [t, f, t, f, t, f, t, f, t, f])
        woodblockRhythm = Rhythm(tempo: 220, numBeats: 10, beats: [t, f, f, t, f, f, t, f, t, f])
        exercises.append(AnyView(RhythmExercise(shakerRhythm: shakerRhythm, woodblockRhythm: woodblockRhythm, exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        endSection()
        
        // 7 beat shaker
        shakerRhythm = Rhythm(tempo: 220, numBeats: 7, beats: [true, false, false, true, false, true, false])
        exercises.append(AnyView(RhythmExercise(shakerRhythm: shakerRhythm, woodblockRhythm: nil, exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        
        // 14 beat shaker + wood
        shakerRhythm = Rhythm(tempo: 240, numBeats: 14, beats: [t, f, f, t, f, t, f, t, f, f, t, f, t, f])
        woodblockRhythm = Rhythm(tempo: 240, numBeats: 14, beats: [t, f, f, t, f, f, f, t, f, f, f, f, t, f])
        exercises.append(AnyView(RhythmExercise(shakerRhythm: shakerRhythm, woodblockRhythm: woodblockRhythm, exerciseState: $exerciseState, exerciseCorrect: $exerciseCorrect)))
        endSection()
    }
}
