//
//  RhythmKit.swift
//  SimpleMusicTheory
//
//  Created by John Watson on 1/25/21.
//

import SwiftUI
import Combine

public struct RhythmKit: View {
    @State var alreadyStarted = false
    @Binding var exerciseState: ExerciseState
    @State var shakerMuted = false
    @State var woodblockMuted = false

    // Shaker rhythm required
    let shakerRhythm: Rhythm
    // Woodblock rhythm not required
    // NOTE: shaker rhythm and woodblock tempo and numBeats should be equal
    let woodblockRhythm: Rhythm?
    @Binding var shakerBeatsSelected: [Bool]
    @Binding var woodblockBeatsSelected: [Bool]

    @State var rhythmKitInstrument: RhythmKitInstrument!

    @State var timer = Timer.publish(every: TimeInterval(Int.max), on: .main, in: .common).autoconnect()
    @State var currentBeatIndex: Int?
    
    private let screenWidth = UIScreen.main.fixedCoordinateSpace.bounds.width
    private var keySize: CGFloat {
        return (screenWidth / 9).clamp(to: 45...90)
    }
    private var keysWrap: Bool {
        return keySize * CGFloat(shakerRhythm.numBeats) > screenWidth * 0.8
    }

    private func start() {
        rhythmKitInstrument = RhythmKitInstrument()
        rhythmKitInstrument.start()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
            timer = Timer.publish(every: shakerRhythm.period, on: .main, in: .common).autoconnect()
        }
    }

    private func toggleShakerMuted() {
        shakerMuted.toggle()
        if shakerMuted {
            rhythmKitInstrument.muteShaker()
        } else {
            rhythmKitInstrument.unmuteShaker()
        }
    }

    private func toggleWoodblockMuted() {
        woodblockMuted.toggle()
        if woodblockMuted {
            rhythmKitInstrument.muteWoodblock()
        } else {
            rhythmKitInstrument.unmuteWoodblock()
        }
    }

    public var body: some View {
        VStack(alignment: .leading) {
            // Shaker group
            HStack() {
                Text("Shaker")
                Button(action: {
                    toggleShakerMuted()
                }) {
                    Image(systemName: shakerMuted ? "speaker.fill" : "speaker.3.fill")
                }
                Spacer()
            }
            .font(.system(.title2, design: .rounded))
            .foregroundColor(ColorPalette.white)
            ScrollView(.horizontal, showsIndicators: false) {
                if keysWrap {
                    VStack() {
                        HStack() {
                            ForEach(0..<shakerRhythm.numBeats / 2) { index in
                                RhythmKitKey(keySize: keySize, beatIndex: index, beats: shakerRhythm.beats, exerciseState: $exerciseState, currentBeatIndex: $currentBeatIndex, beatsSelected: $shakerBeatsSelected)
                            }
                        }
                        HStack() {
                            ForEach(shakerRhythm.numBeats / 2..<shakerRhythm.numBeats) { index in
                                RhythmKitKey(keySize: keySize, beatIndex: index, beats: shakerRhythm.beats, exerciseState: $exerciseState, currentBeatIndex: $currentBeatIndex, beatsSelected: $shakerBeatsSelected)
                                    .offset(x: keySize / 2.0)
                            }
                        }
                    }
                } else {
                    HStack() {
                        ForEach(0..<shakerRhythm.numBeats) { index in
                            RhythmKitKey(keySize: keySize, beatIndex: index, beats: shakerRhythm.beats, exerciseState: $exerciseState, currentBeatIndex: $currentBeatIndex, beatsSelected: $shakerBeatsSelected)
                        }
                    }
                }
            }

            // Woodblock group
            if woodblockRhythm != nil {
                HStack() {
                    Text("Woodblock")
                    Button(action: {
                        toggleWoodblockMuted()
                    }) {
                        Image(systemName: woodblockMuted ? "speaker.fill" : "speaker.3.fill")
                    }
                    Spacer()
                }
                .font(.system(.title2, design: .rounded))
                .foregroundColor(ColorPalette.white)
                ScrollView(.horizontal, showsIndicators: false) {
                    if keysWrap {
                        VStack() {
                            HStack() {
                                ForEach(0..<woodblockRhythm!.numBeats / 2) { index in
                                    RhythmKitKey(keySize: keySize, beatIndex: index, beats: woodblockRhythm!.beats, exerciseState: $exerciseState, currentBeatIndex: $currentBeatIndex, beatsSelected: $woodblockBeatsSelected)
                                }
                            }
                            HStack() {
                                ForEach(woodblockRhythm!.numBeats / 2..<woodblockRhythm!.numBeats) { index in
                                    RhythmKitKey(keySize: keySize, beatIndex: index, beats: woodblockRhythm!.beats, exerciseState: $exerciseState, currentBeatIndex: $currentBeatIndex, beatsSelected: $woodblockBeatsSelected)
                                        .offset(x: keySize / 2.0)
                                }
                            }
                        }
                    } else {
                        HStack() {
                            ForEach(0..<woodblockRhythm!.numBeats) { index in
                                RhythmKitKey(keySize: keySize, beatIndex: index, beats: woodblockRhythm!.beats, exerciseState: $exerciseState, currentBeatIndex: $currentBeatIndex, beatsSelected: $woodblockBeatsSelected)
                            }
                        }
                    }
                }
            }
        }.padding()
        .onAppear() {
            if !self.alreadyStarted && exerciseState == .active {
                self.start()
            }
        }.onChange(of: exerciseState) { newState in
            if !self.alreadyStarted && newState == .active {
                self.start()
            } else if newState == .closing {
                rhythmKitInstrument.stop()
                exerciseState = .completed
            }
        }.onReceive(timer) { _ in
            if !alreadyStarted {
                currentBeatIndex = 0
                alreadyStarted = true
            } else {
                currentBeatIndex = (currentBeatIndex! + 1) % shakerRhythm.numBeats
            }
            if alreadyStarted && shakerRhythm.beats[currentBeatIndex!] {
                rhythmKitInstrument.pulseShaker()
            }
            if woodblockRhythm != nil {
                if alreadyStarted && woodblockRhythm!.beats[currentBeatIndex!] {
                    rhythmKitInstrument.pulseWoodblock()
                }
            }
        }
    }
}
