//
//  LessonView.swift
//  Sono
//
//  Created by John Watson on 12/2/20.
//

import SwiftUI

struct LessonView: View {
    @EnvironmentObject var userData: UserData
    @EnvironmentObject var pageState: PageState

    @State var active = true
    @State var exerciseState = ExerciseState.active
    @State var exerciseCorrect = false

    let lesson: Lesson

    @State var exercises: [AnyView] = []
    @State var exerciseIndex = 0
    @State var exerciseCount = 0
    @State var progressIndex = 0
    @State var progressCount = 1
    @State var sectionEnds: [Int] = []

    private func toNextExercise() {
        if exerciseCorrect {
            progressIndex += 1
        } else {
            let sectionIndex = sectionEnds.reduce(0, { $0 + (exerciseIndex < $1 ? 0 : 1) })
            print("section index \(sectionIndex)")
            exercises.insert(exercises[exerciseIndex], at: sectionEnds[sectionIndex])
            exerciseCount += 1
            // Shift all section ends 1 forward
            sectionEnds = sectionEnds.map( { $0 + (exerciseIndex < $0 ? 1 : 0) } )
        }
        exerciseIndex += 1

        if (exerciseIndex >= exerciseCount) {
            withAnimation(Animation.easeOut.delay(0.5)) {
                finishLesson()
            }
        } else {
            exerciseState = .active
        }
    }

    private func finishLesson() {
        active = false
        // Mark lesson complete
        userData.markLessonCompleted(lesson: self.lesson)
        pageState.pageType = .main
    }

    var body: some View {
        ZStack() {
            ColorPalette.blue
                .ignoresSafeArea()
            VStack() {
                self.topBar
                ForEach(0 ..< exerciseCount, id: \.self) { index in
                    if min(exerciseCount - 1, exerciseIndex) == index {
                        exercises[index]
                            .animation(Animation.easeInOut.delay(0.1))
                            .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
                            .onChange(of: exerciseState) { newState in
                                if newState == .completed {
                                    if active {
                                        toNextExercise()
                                    } else {
                                        pageState.pageType = .main
                                    }
                                }
                            }
                    }
                }
            }
        }
        .onAppear(perform: createExercises)
    }

    private var topBar: some View {
        HStack() {
            Button(action: {
                active = false
                exerciseState = .closing
            }) {
                Image(systemName: "xmark")
                    .font(.system(size: 30, weight: .bold))
                    .foregroundColor(ColorPalette.white)
            }

            ProgressBar(index: $progressIndex, count: progressCount)
                .padding(10)
            /**
            Button(action: {
                
            }) {
                Image(systemName: "gear")
                    .font(.system(size: 30, weight: .bold))
                    .foregroundColor(ColorPalette.white)
            }
            */
        }.padding()
    }
}

struct LessonView_Previews: PreviewProvider {
    static var previews: some View {        
        LessonView(lesson: .sound)
            .environmentObject(UserData())
            .environmentObject(PageState(lesson: .sound))
    }
}
