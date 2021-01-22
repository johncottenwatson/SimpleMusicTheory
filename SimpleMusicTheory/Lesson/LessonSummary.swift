//
//  LessonSummary.swift
//  Sono
//
//  Created by John Watson on 12/8/20.
//

import SwiftUI

struct LessonSummary {
    let lesson: Lesson
    let type: LessonType
    let row: Int
}

let lessonSummaries: [LessonSummary] =
    [LessonSummary(lesson: .sound, type: .generic, row: 1),
     
     LessonSummary(lesson: .twelveNotes, type: .pitch, row: 2),
     LessonSummary(lesson: .rhythm1, type: .rhythm, row: 2),
     
     LessonSummary(lesson: .rhythm2, type: .rhythm, row: 3),
     LessonSummary(lesson: .chord1, type: .pitch, row: 3),
     
     LessonSummary(lesson: .chord2, type: .pitch, row: 4),
     LessonSummary(lesson: .scale1, type: .pitch, row: 4),
     
     LessonSummary(lesson: .chord3, type: .pitch, row: 5),
     LessonSummary(lesson: .rhythm3, type: .rhythm, row: 5),
     
     LessonSummary(lesson: .scale2, type: .pitch, row: 6),
     LessonSummary(lesson: .chord4, type: .pitch, row: 6)
    ]
