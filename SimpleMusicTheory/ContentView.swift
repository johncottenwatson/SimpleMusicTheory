//
//  ContentView.swift
//  Sono
//
//  Created by John Watson on 12/2/20.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var userData: UserData
    @EnvironmentObject var pageState: PageState

    var body: some View {
        switch pageState.pageType {
        case .launch:
            LaunchView()
                .onAppear() {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                        withAnimation {
                            pageState.pageType = .main
                        }
                    }
                }
        case .main:
            MainView()
                .transition(.opacity)
        case .lesson:
            LessonView(lesson: pageState.lesson!)
                .onDisappear {
                    AudioManager.mainMixer.disconnectInput()
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserData())
            .environmentObject(PageState())
    }
}
