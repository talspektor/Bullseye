//
//  TextViews.swift
//  Bullseye
//
//  Created by Tal talspektor on 16/05/2021.
//

import SwiftUI

struct InstructionText: View {
    var text: String
    
    var body: some View {
        Text(text.uppercased())
            .bold()
            .kerning(2.0)
            .multilineTextAlignment(.center)
            .lineSpacing(4.0)
            .font(.footnote)
            .foregroundColor(Color.textColor)
    }
}

struct BigNumberText: View {
    var text: String

    var body: some View {
        Text(text)
            .kerning(-1.0)
            .font(.largeTitle)
            .fontWeight(.black)
            .foregroundColor(Color.textColor)

    }
}

struct SliderLabelText: View {
    var text: String

    var body: some View {
        Text(text)
            .bold()
            .foregroundColor(Color.textColor)
            .frame(width: 35.0)
    }
}

struct LabelText: View {
    var text: String

    var body: some View {
        Text(text)
            .bold()
            .font(.caption)
            .foregroundColor(Color.textColor)
            .kerning(1.5)
    }
}

struct BodyText: View {
    var text: String

    var body: some View {
        Text(text)
            .font(.subheadline)
            .fontWeight(.semibold)
            .lineSpacing(12.0)
            .multilineTextAlignment(.center)
    }
}

struct ScoreText: View {
    var score: Int

    var body: some View {
        Text(String(score))
            .bold()
            .kerning(-0.2)
            .foregroundColor(Color.textColor)
            .font(.title3)
    }
}

struct DateText: View {
    var date: Date

    var body: some View {
        Text(date, style: .time)
            .bold()
            .kerning(-0.2)
            .foregroundColor(Color.textColor)
            .font(.title3)
    }
}

struct ButtonText: View {
    var text: String

    var body: some View {
        Text(text)
            .bold()
            .padding()
            .frame(maxWidth: .infinity)
            .background(
                Color.accentColor
            )
            .foregroundColor(Color.white)
            .cornerRadius(12.0)
    }
}

struct BigBoldText: View {
    let text: String

    var body: some View {
        Text(text.uppercased())
            .kerning(2.0)
            .font(.title)
            .foregroundColor(Color.textColor)
            .fontWeight(.black)
    }
}

struct TextViews_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            InstructionText(text: "Instructions")
            BigNumberText(text: "999")
            SliderLabelText(text: "99")
            LabelText(text: "9")
            BodyText(text: "You scored 200 Points\n🍧🍧🍧")
            ButtonText(text: "Start New Round")
            ScoreText(score: 259)
            DateText(date: Date())
            BigBoldText(text: "Leaderboard")
        }
        .padding()

    }
}
