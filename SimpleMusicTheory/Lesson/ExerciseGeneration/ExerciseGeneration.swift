//
//  ExerciseGeneration.swift
//  Sono
//
//  Created by John Watson on 1/16/21.
//

import SwiftUI

extension LessonView {
    public func createExercises() {        
        switch(lesson) {
        // Row 1
        case .sound:
            generateSoundExercises()

        // Row 2
        case .twelveNotes:
            generate12NotesExercises()
        case .rhythm1:
            generateRhythm1Exercises()
            
        // Row 3
        case .rhythm2:
            generateRhythm2Exercises()
        case .chord1:
            generateChord1Exercises()
            
        // Row 4
        case .chord2:
            generateChord2Exercises()
        case .scale1:
            generateScale1Exercises()
            
        // Row 5
        case .chord3:
            generateChord3Exercises()
        case .rhythm3:
            generateRhythm3Exercises()
            
        // Row 6
        case .scale2:
            generateScale2Exercises()
        case .chord4:
            generateChord4Exercises()
        }

        exerciseCount = exercises.count
        progressCount = exercises.count
    }

    public func endSection() {
        sectionEnds.append(exercises.count)
    }
}
