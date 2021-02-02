//
//  Keyboard.swift
//  Sono
//
//  Created by John Watson on 1/18/21.
//

import SwiftUI

public struct Keyboard: View {

    let lowestOctave = 4
    let accidentalsOffsetRatios: [CGFloat] = [0.5, 0.5, 1.75, 1.75, 1.75]

    let numOctaves: Int
    let letterNames: Bool
    let isFlatLayout: Bool
    let isMonophonic: Bool
    
    @State var alreadyStarted = false
    @Binding var exerciseState: ExerciseState

    @Binding var notes: Set<Note>

    let correctPitchClassSet: Set<PitchClass>

    private let screenWidth = UIScreen.main.fixedCoordinateSpace.bounds.width
    private var keySize: CGFloat {
        return (screenWidth / 9).clamp(to: 45...90)
    }

    @State var keyboardInstrument: KeyboardInstrument!

    private func start() {
        keyboardInstrument = KeyboardInstrument(numOctaves: numOctaves)
        keyboardInstrument.start()
        self.alreadyStarted = true
    }

    public var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .bottom) {
                ForEach(lowestOctave ..< lowestOctave + numOctaves, id: \.self) { octave in
                    if isFlatLayout {
                        // Flat keyboard layout
                        HStack() {
                            ForEach(0 ..< 12) { index in
                                let note = Note(pitchClass: PitchClass(rawValue: index)!, octave: octave)
                                KeyboardKey(keySize: self.keySize, letterNames: letterNames, isMonophonic: isMonophonic, note: note, notes: $notes, exerciseState: $exerciseState, correctPitchClassSet: correctPitchClassSet)
                            }
                        }
                    } else {
                        // Standard keyboard layout
                        VStack(alignment: .leading) {
                            // Accidentals
                            HStack() {
                                ForEach(0..<5) { accidentalsIndex in
                                    let note = Note(pitchClass: PitchClass.accidentals[accidentalsIndex], octave: octave)
                                    KeyboardKey(keySize: self.keySize, letterNames: letterNames, isMonophonic: isMonophonic, note: note, notes: $notes, exerciseState: $exerciseState, correctPitchClassSet: correctPitchClassSet)
                                        .offset(x: keySize * accidentalsOffsetRatios[accidentalsIndex])
                                }
                            }
                            // Naturals
                            HStack() {
                                ForEach(0..<7) { naturalsIndex in
                                    let note = Note(pitchClass: PitchClass.naturals[naturalsIndex], octave: octave)
                                    KeyboardKey(keySize: self.keySize, letterNames: letterNames, isMonophonic: isMonophonic, note: note, notes: $notes, exerciseState: $exerciseState, correctPitchClassSet: correctPitchClassSet)
                                }
                            }
                        }
                    }
                }
                // Final note
                let finalNote = Note(pitchClass: .c, octave: lowestOctave + numOctaves)
                KeyboardKey(keySize: self.keySize, letterNames: letterNames, isMonophonic: isMonophonic, note: finalNote, notes: $notes, exerciseState: $exerciseState, correctPitchClassSet: correctPitchClassSet)
            }.disabled(exerciseState != .active)
            .padding(.horizontal, 8.0)
        }.onAppear() {
            if !self.alreadyStarted && exerciseState == .active {
                self.start()
            }
        }.onChange(of: exerciseState) { newState in
            if !self.alreadyStarted && newState == .active {
                self.start()
            } else if newState == .closing {
                keyboardInstrument.stop()
                exerciseState = .completed
            }
        }.onChange(of: notes) { _ in
            keyboardInstrument.updateNotesTo(notes: notes)
        }
    }
}

struct Keyboard_Previews: PreviewProvider {
    static var previews: some View {
        ZStack() {
            ColorPalette.blue
                .ignoresSafeArea()
            Keyboard(numOctaves: 2, letterNames: true, isFlatLayout: false, isMonophonic: false, exerciseState: .constant(.active), notes: .constant([]), correctPitchClassSet: [])
        }
    }
}
