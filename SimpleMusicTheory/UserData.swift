//
//  UserData.swift
//  Sono
//
//  Created by John Watson on 12/11/20.
//

import SwiftUI

class UserData: ObservableObject {
    
    init() {
    }

    @AppStorage(wrappedValue: false, "postFirstLaunch") var postFirstLaunch: Bool
    
    @AppStorage(wrappedValue: 0, "sessionNumber") var sessionNumber: Int
    
    @AppStorage(wrappedValue: 1, "lessonRow") var lessonRow: Int
    
    @AppStorage(wrappedValue: String(repeating: "0", count: lessonSummaries.count), "unlockedLessonsDict") private var unlockedLessonsString: String
    @AppStorage(wrappedValue: String(repeating: "0", count: lessonSummaries.count), "completedLessonsDict") private var completedLessonsString: String
    
    private func unlockNextLessonRow() {
        let nextRow = lessonSummaries.filter { $0.row == lessonRow + 1 }
        for lessonSummary in nextRow {
            markLessonUnlocked(lesson: lessonSummary.lesson)
        }
    }
    
    func markLessonUnlocked(lesson: Lesson) {
        guard let index = lessonSummaries.firstIndex(where: {$0.lesson == lesson}) else { return }
        var chars = Array(unlockedLessonsString)
        chars[index] = "1"
        unlockedLessonsString = String(chars)
    }
    
    func isLessonUnlocked(lesson: Lesson) -> Bool {
        guard let index = lessonSummaries.firstIndex(where: {$0.lesson == lesson}) else { return false }
        let chars = Array(unlockedLessonsString)
        return chars[index] == "1"
    }
    
    func markLessonCompleted(lesson: Lesson) {
        guard let index = lessonSummaries.firstIndex(where: {$0.lesson == lesson}) else { return }
        var chars = Array(completedLessonsString)
        chars[index] = "1"
        completedLessonsString = String(chars)
        // Check for row completed
        let currentRow = lessonSummaries.filter { $0.row == lessonRow }
        let rowComplete = currentRow.allSatisfy { isLessonCompleted(lesson: $0.lesson) }
        if rowComplete {
            unlockNextLessonRow()
            lessonRow += 1
        }
    }
    
    func isLessonCompleted(lesson: Lesson) -> Bool {
        guard let index = lessonSummaries.firstIndex(where: {$0.lesson == lesson}) else { return false }
        let chars = Array(completedLessonsString)
        return chars[index] == "1"
    }
}
