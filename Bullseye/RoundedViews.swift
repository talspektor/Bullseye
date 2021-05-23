//
//  RoundedViews.swift
//  Bullseye
//
//  Created by Tal talspektor on 17/05/2021.
//

import SwiftUI

struct RoundedImageViewStroked: View {
    var systemName: String

    var body: some View {
        Image(systemName: systemName)
            .font(.title)
            .foregroundColor(Color.textColor)
            .frame(width: Constants.General.roundViewLength, height: Constants.General.roundViewLength)
            .overlay(
                Circle()
                    .strokeBorder(Color.buttonStrokeColor)
            )
    }
}

struct RoundedImageViewFilled: View {
    var systemName: String

    var body: some View {
        Image(systemName: systemName)
            .font(.title)
            .foregroundColor(Color.buttonFilledTextColor)
            .frame(width: Constants.General.roundViewLength, height: Constants.General.roundViewLength)
            .background(
                Circle()
                    .fill(Color.buttonFilledBackgroungColor)

            )
    }
}

struct RoundRectTextVeiw: View {
    var text: String

    var body: some View {
        Text(text)
            .bold()
            .font(.title3)
            .kerning(-0.2)
            .frame(width: Constants.General.roundRectViewWidth, height: Constants.General.roundRectViewHeight)
            .foregroundColor(Color.textColor)
            .overlay(
                Circle()
                    .strokeBorder(Color.leaderBoardRowColor,
                                  lineWidth: Constants.General.strokeWidth)
            )
    }
}

struct RoundedTextView: View {
    let text: String

    var body: some View {
        Text(text)
            .font(.title)
            .frame(width: Constants.General.roundViewLength,
                   height: Constants.General.roundViewLength)
            .foregroundColor(Color.textColor)
            .overlay(
                Circle()
                    .strokeBorder(Color.leaderBoardRowColor,
                                  lineWidth: Constants.General.strokeWidth)
                    .foregroundColor(Color.leaderBoardRowColor)
            )
    }
}

struct PreviewView: View {
    var body: some View {
        VStack(spacing: 10) {
            RoundedImageViewStroked(systemName: "arrow.counterclockwise")
            RoundedImageViewFilled(systemName: "list.dash")
            RoundRectTextVeiw(text: "0")
            RoundedTextView(text: "1")
        }

    }
}

struct RoundedViews_Previews: PreviewProvider {
    static var previews: some View {
        PreviewView()
        PreviewView()
            .preferredColorScheme(.dark)
    }
}
