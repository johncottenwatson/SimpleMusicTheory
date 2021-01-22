//
//  SimpleMusicTheoryApp.swift
//  Sono
//
//  Created by John Watson on 12/2/20.
//

import SwiftUI

@main
struct SimpleMusicTheoryApp: App {
    
    let userData = UserData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .statusBar(hidden: true)
                .environmentObject(userData)
                .environmentObject(PageState())
                .onAppear() {
                    AudioManager.start()
                    if (userData.postFirstLaunch) {
                        userData.sessionNumber += 1
                    } else {
                        initializeUserData()
                    }
                }
        }
    }
    
    func initializeUserData() {
        userData.postFirstLaunch = true
        userData.sessionNumber = 1
        // Lesson completions dictionary
        userData.markLessonUnlocked(lesson: .sound)
    }
}
