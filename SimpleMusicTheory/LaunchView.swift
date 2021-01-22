//
//  LaunchView.swift
//  Sono
//
//  Created by John Watson on 12/2/20.
//

import SwiftUI

struct LaunchView: View {
    var body: some View {
        ZStack() {
            ColorPalette.blue
                .ignoresSafeArea()
            Text("Simple Music Theory")
                .foregroundColor(ColorPalette.white)
                .font(.system(size: 32, design: .rounded))
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
        }
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}

