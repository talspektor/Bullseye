//
//  TextViews.swift
//  Bullseye
//
//  Created by Tal talspektor on 16/05/2021.
//

import SwiftUI

struct InstructionText: View {
    @Environment(\.colorScheme) var colorScheme
    var text: String
    
    var body: some View {
        Text(text.uppercased())
            .bold()
            .kerning(2.0)
            .multilineTextAlignment(.center)
            .lineSpacing(4.0)
            .font(.footnote)
            .foregroundColor(colorScheme == .light ? Color.Light.textColor : Color.Dark.textColor)
    }
}

struct BigNumberText: View {
    @Environment(\.colorScheme) var colorScheme
    var text: String

    var body: some View {
        Text(text)
            .kerning(-1.0)
            .font(.largeTitle)
            .fontWeight(.black)
            .foregroundColor(colorScheme == .light ? Color.Light.textColor : Color.Dark.textColor)

    }
}

struct SliderLabelText: View {
    @Environment(\.colorScheme) var colorScheme
    var text: String

    var body: some View {
        Text(text)
            .bold()
            .foregroundColor(colorScheme == .light ? Color.Light.textColor : Color.Dark.textColor)
            .frame(width: 35.0)
    }
}

struct LabelText: View {
    @Environment(\.colorScheme) var colorScheme
    var text: String

    var body: some View {
        Text(text)
            .bold()
            .font(.caption)
            .foregroundColor(colorScheme == .light ? Color.Light.textColor : Color.Dark.textColor)
            .kerning(1.5)
    }
}

struct TextViews_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            InstructionText(text: "Instructions")
            BigNumberText(text: "999")
            LabelText(text: "score")
        }

    }
}
