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
            Text("simple\nmusic\ntheory")
                .foregroundColor(ColorPalette.white)
                .font(.system(size: 48, design: .rounded))
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
        }
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}

