//
//  HertzSpectrum.swift
//  SimpleMusicTheory
//
//  Created by John Watson on 1/27/21.
//

import SwiftUI

public struct HertzSpectrum: View {
    
    @State var height : CGFloat? = nil
    
    let barWidth: CGFloat = 12.0
    let labelOffset: CGFloat = 70.0
    
    let gradientHeights: [CGFloat] = [0.3, 0.6, 0.95]
    let patternLabelHeights: [CGFloat] = [0.05, 0.6, 0.95]
    let hertzLabelHeights: [CGFloat] = [0.05, 0.6, 0.8, 0.95]
    var gradient: Gradient {
        return Gradient(stops: [.init(color: ColorPalette.pink, location: gradientHeights[0]),
                                .init(color: ColorPalette.darkBlue, location: gradientHeights[1]),
                                .init(color: ColorPalette.white, location: gradientHeights[2])])
    }
    
    @State var alreadyStarted = false
    @Binding var exerciseState: ExerciseState

    private func start() {
        alreadyStarted = true
    }
    
    public var body: some View {
        ZStack() {
            Rectangle()
                .fill(LinearGradient(gradient: gradient, startPoint: .top, endPoint: .bottom))
                .frame(width: barWidth)
                .cornerRadius(barWidth / 2.0)
            ZStack(alignment: .trailing) {
                Text("Pitch")
                    .offset(x: -labelOffset, y: (height ?? 0.0) * patternLabelHeights[0] - (height ?? 0.0) / 2.0)
                Text("Rhythm")
                    .offset(x: -labelOffset, y: (height ?? 0.0) * patternLabelHeights[1] - (height ?? 0.0) / 2.0)
                Text("Form")
                    .offset(x: -labelOffset, y: (height ?? 0.0) * patternLabelHeights[2] - (height ?? 0.0) / 2.0)
            }
            .font(.system(.title2, design: .rounded))
            .foregroundColor(ColorPalette.white)
            .animation(.none, value: height)
            ZStack(alignment: .leading) {
                Text("20 000 Hz")
                    .offset(x: labelOffset + barWidth, y: (height ?? CGFloat(0.0)) * hertzLabelHeights[0] - (height ?? 0.0) / CGFloat(2.0))
                Text("20 Hz")
                    .offset(x: labelOffset + barWidth, y: (height ?? CGFloat(0.0)) * hertzLabelHeights[1] - (height ?? 0.0) / CGFloat(2.0))
                Text("0.2 Hz")
                    .offset(x: labelOffset + barWidth, y: (height ?? CGFloat(0.0)) * hertzLabelHeights[2] - (height ?? 0.0) / CGFloat(2.0))
                Text("0.0002 Hz")
                    .offset(x: labelOffset + barWidth, y: (height ?? CGFloat(0.0)) * hertzLabelHeights[3] - (height ?? 0.0) / CGFloat(2.0))
            }
            .font(.system(.body, design: .rounded))
            .foregroundColor(ColorPalette.white)
            .frame(maxWidth: 100.0)
            .animation(.none, value: height)
        }
        .background(GeometryReader { proxy in
            Color.clear.preference(key: SizeKey.self, value: proxy.size)
        })
        .onAppear() {
            print(cos(2.0 * Double.pi))
            if !self.alreadyStarted && exerciseState == .active {
                self.start()
            }
        }.onChange(of: exerciseState) { newState in
            if !self.alreadyStarted && newState == .active {
                self.start()
            } else if newState == .closing {
                exerciseState = .completed
            }
        }.onPreferenceChange(SizeKey.self) { size in
            self.height = size?.height
        }
    }
}

fileprivate struct SizeKey: PreferenceKey {
    static func reduce(value: inout CGSize?, nextValue: () -> CGSize?) {
        value = value ?? nextValue()
    }
}
