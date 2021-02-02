//
//  ProgressBar.swift
//  Sono
//
//  Created by John Watson on 12/8/20.
//

import SwiftUI

struct ProgressBar: View {
    
    @State var width : CGFloat? = nil
    @Binding var index: Int
    let count: Int
    private var progress: Float {
        return Float(index) / Float(count)
    }
    
    var body: some View {
        ZStack(alignment: .leading) {
            Capsule()
                .frame(height: 16)
                .foregroundColor(ColorPalette.white)
                .background(GeometryReader { proxy in
                    Color.clear.preference(key: SizeKey.self, value: proxy.size)
                })
                .onPreferenceChange(SizeKey.self) { size in
                    self.width = size?.width
                }
            Capsule()
                .frame(width: (width ?? 0) * CGFloat(progress.clamp(to: 0...1)), height: 16)
                .foregroundColor(ColorPalette.green)
                .animation(.linear)
        }
    }
}

fileprivate struct SizeKey: PreferenceKey {
    static func reduce(value: inout CGSize?, nextValue: () -> CGSize?) {
        value = value ?? nextValue()
    }
}
