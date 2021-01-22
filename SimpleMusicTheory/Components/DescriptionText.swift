//
//  DescriptionText.swift
//  Sono
//
//  Created by John Watson on 1/16/21.
//

import SwiftUI

struct DescriptionText: View {
    
    let text: Text
    
    var body: some View {
        HStack() {
            text
                .font(.system(.title2, design: .rounded))
                .multilineTextAlignment(.leading)
                .foregroundColor(ColorPalette.white)
                .padding()
                .layoutPriority(1)
            Spacer()
                .frame(minWidth: 0, idealWidth: 0)
        }

    }
}

struct DescriptionText_Previews: PreviewProvider {
    static var previews: some View {
        ZStack() {
            ColorPalette.blue
                .ignoresSafeArea()
            DescriptionText(text: Text("What note is ")
                                + Text("1").bold()
                                + Text(" semitone above ")
                                + Text("F").bold()
                                + Text("?"))
        }
    }
}
