//
//  MainView.swift
//  Sono
//
//  Created by John Watson on 12/2/20.
//

import SwiftUI

struct MainView: View {

    @EnvironmentObject var userData: UserData
    @EnvironmentObject var pageState: PageState
    
    var body: some View {
        ZStack() {
            ColorPalette.blue
                .ignoresSafeArea()
            ScrollView(showsIndicators: false) {
                // Temporary? workaround to make ScrollView scrollable for whole width of screen
                Color.clear
                
                // Row 1
                LessonGlyphView(lessonSummary: lessonSummaries[0])
                // Row 2
                HStack() {
                    LessonGlyphView(lessonSummary: lessonSummaries[1])
                    LessonGlyphView(lessonSummary: lessonSummaries[2])
                }
                // Row 3
                HStack() {
                    LessonGlyphView(lessonSummary: lessonSummaries[3])
                    LessonGlyphView(lessonSummary: lessonSummaries[4])
                }
                // Row 4
                HStack() {
                    LessonGlyphView(lessonSummary: lessonSummaries[5])
                    LessonGlyphView(lessonSummary: lessonSummaries[6])
                }
                // Row 5
                HStack() {
                    LessonGlyphView(lessonSummary: lessonSummaries[7])
                    LessonGlyphView(lessonSummary: lessonSummaries[8])
                }
                // Row 6
                HStack() {
                    LessonGlyphView(lessonSummary: lessonSummaries[9])
                    LessonGlyphView(lessonSummary: lessonSummaries[10])
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(UserData())
            .environmentObject(PageState())
    }
}
