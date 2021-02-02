//
//  RhythmKitKey.swift
//  SimpleMusicTheory
//
//  Created by John Watson on 1/25/21.
//

import SwiftUI

struct RhythmKitKey: View {
    
    let animationDuration: Double = 0.03
    let emphasisScaleFactor: CGFloat = 1.35
    
    let keySize: CGFloat
    let beatIndex: Int
    let beats: [Bool]
    
    @State var isSelected: Bool = false
    @Binding var exerciseState: ExerciseState
    @Binding var currentBeatIndex: Int?
    @Binding var beatsSelected: [Bool]

    private var isCorrectBeat: Bool {
        return beats[beatIndex]
    }

    var body: some View {
        Button(action: {
            isSelected.toggle()
            if isSelected {
                beatsSelected[beatIndex] = true
            } else {
                beatsSelected[beatIndex] = false
            }
        }) {
            ZStack() {
                Rectangle()
                    .frame(width: keySize, height: keySize)
                    .cornerRadius(8.0)
                    .foregroundColor(getRectangleColor(isSelected: isSelected, exerciseState: exerciseState))
                Text("\(beatIndex + 1)")
                    .font(.system(.title2, design: .rounded))
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundColor(isSelected ? ColorPalette.white : ColorPalette.darkBlue)
                    .scaleEffect((currentBeatIndex == beatIndex) ? emphasisScaleFactor : 1.0)
                    .animation(.easeInOut(duration: animationDuration), value: currentBeatIndex)
            }
        }
    }

    func getRectangleColor(isSelected: Bool, exerciseState: ExerciseState) -> Color {
        if !isSelected {
            return ColorPalette.white
        }
        if exerciseState < .answered {
            return ColorPalette.darkBlue
        }
        if self.isCorrectBeat {
            return ColorPalette.green
        }
        return ColorPalette.pink
    }
}
