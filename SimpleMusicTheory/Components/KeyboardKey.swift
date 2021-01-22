//
//  KeyboardKey.swift
//  Sono
//
//  Created by John Watson on 1/18/21.
//

import SwiftUI

struct KeyboardKey: View {
    
    let keySize: CGFloat
    let isMonophonic: Bool
    var note: Note
    
    @Binding var notes: Set<Note>
    @State var isSelected: Bool = false
    @Binding var exerciseState: ExerciseState

    let correctPitchClassSet: Set<PitchClass>
    private var isCorrectNote: Bool {
        return correctPitchClassSet.contains(note.pitchClass)
    }

    var body: some View {
        Button(action: {
            if isMonophonic {
                if isSelected {
                    notes.remove(note)
                    isSelected = false
                } else {
                    notes.removeAll()
                    notes.insert(note)
                    isSelected = true
                }
            } else {
                isSelected.toggle()
                if isSelected {
                    notes.insert(note)
                } else {
                    notes.remove(note)
                }
            }
        }) {
            ZStack() {
                Rectangle()
                    .frame(width: keySize, height: keySize)
                    .cornerRadius(8.0)
                    .foregroundColor(getRectangleColor(isSelected: isSelected, exerciseState: exerciseState))
                Text(note.name)
                    .font(.system(.title2, design: .rounded))
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundColor(isSelected ? ColorPalette.white : ColorPalette.darkBlue)
            }
        }.onChange(of: notes) { _ in
            if isMonophonic {
                if isSelected && !notes.contains(note) {
                    isSelected = false
                }
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
        if self.isCorrectNote {
            return ColorPalette.green
        }
        return ColorPalette.pink
    }
}
