//
//  LessonGlyphView.swift
//  Sono
//
//  Created by John Watson on 12/8/20.
//

import SwiftUI

struct LessonGlyphView: View {
    @EnvironmentObject var userData: UserData
    @EnvironmentObject var pageState: PageState
    let lessonSummary: LessonSummary
    var image: some View {
        get {
            switch(lessonSummary.type) {
            case .generic:
                return AnyView(Image(systemName: "waveform")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .foregroundColor(ColorPalette.white))
            case .pitch:
                return AnyView(Image("sineWave")
                                .resizable()
                                .frame(width: 60, height: 60)
                                .colorMultiply(ColorPalette.white))
            case .rhythm:
                return AnyView(Image(systemName: "metronome")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .foregroundColor(ColorPalette.white))
            case .tuning:
                return AnyView(Image(systemName: "tuningfork")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .foregroundColor(ColorPalette.white))
            }
        }
    }
    
    var color: Color {
        get {
            switch(lessonSummary.type) {
            case .generic:
                return ColorPalette.pink
            case .pitch:
                return ColorPalette.green
            case .rhythm:
                return ColorPalette.orange
            case .tuning:
                return ColorPalette.pink
            }
        }
    }
    
    var body: some View {
        VStack() {
            Button(action: {
                pageState.lesson = lessonSummary.lesson
                pageState.pageType = .lesson
            }) {
                ZStack() {
                    Circle()
                        .strokeBorder(ColorPalette.white, lineWidth: 5)
                        .cornerRadius(20)
                        .background(image)
                        .background(Circle()
                                        .foregroundColor(userData.isLessonUnlocked(lesson: lessonSummary.lesson) ? color : ColorPalette.gray))
                        .frame(width: 80, height: 80)
                    if userData.isLessonCompleted(lesson: lessonSummary.lesson) {
                        Image(systemName: "checkmark.circle.fill")
                            .font(Font.system(.title).bold())
                            .foregroundColor(ColorPalette.white)
                            .background(Circle()
                                            .frame(width: 20, height: 20)
                                            .foregroundColor(ColorPalette.blue))
                            .offset(x: 28.0, y: 28.0)
                    }
                }
            }
            .disabled(!userData.isLessonUnlocked(lesson: lessonSummary.lesson))
            Text(lessonSummary.lesson.rawValue)
                .font(.system(.title2, design: .rounded))
                .fontWeight(.bold)
                .foregroundColor(ColorPalette.white)
        }.frame(width: 150, height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }
}

struct LessonGlyph_Previews: PreviewProvider {
    static var previews: some View {
        ZStack() {
            ColorPalette.blue
                .ignoresSafeArea()
            LessonGlyphView(lessonSummary: lessonSummaries[0])
                .environmentObject(UserData())
                .environmentObject(PageState())
        }
    }
}
