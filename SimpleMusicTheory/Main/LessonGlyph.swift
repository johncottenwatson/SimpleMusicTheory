//
//  LessonGlyph.swift
//  Sono
//
//  Created by John Watson on 12/8/20.
//

import SwiftUI

struct LessonSummary {
    let name: String
    let type: LessonType
    let row: Int
}

let lessonGlyphs: [LessonSummary] =
    [LessonSummary(name: "Sound", type: .generic, row: 1),
     
     LessonSummary(name: "12 Notes", type: .pitch, row: 2),
     LessonSummary(name: "Rhythm 1", type: .rhythm, row: 2),
     
     LessonSummary(name: "Rhythm 2", type: .rhythm, row: 3),
     LessonSummary(name: "Chord 1", type: .pitch, row: 3),
     
     LessonSummary(name: "Chord 2", type: .pitch, row: 4),
     LessonSummary(name: "Scale 1", type: .pitch, row: 4),
     
     LessonSummary(name: "Chord 3", type: .pitch, row: 5),
     LessonSummary(name: "Rhythm 3", type: .rhythm, row: 5),
     
     LessonSummary(name: "Scale 2", type: .pitch, row: 6),
     LessonSummary(name: "Chord 4", type: .pitch, row: 6)
    ]
