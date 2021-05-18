//
//  RoundedViews.swift
//  Bullseye
//
//  Created by Tal talspektor on 17/05/2021.
//

import SwiftUI

struct RoundedImageViewStroked: View {
    @Environment(\.colorScheme) var colorScheme
    var systemName: String

    var body: some View {
        Image(systemName: systemName)
            .font(.title)
            .foregroundColor(colorScheme == .light ? Color.Light.textColor : Color.Dark.textColor)
            .frame(width: 56, height: 56)
            .overlay(
                Circle()
                    .strokeBorder(colorScheme == .light ? Color.Light.buttonStrokeColor: Color.Dark.buttonStrokeColor, lineWidth: 2.0)
            )
    }
}

struct RoundedImageViewFilled: View {
    @Environment(\.colorScheme) var colorScheme
    var systemName: String

    var body: some View {
        Image(systemName: systemName)
            .font(.title)
            .foregroundColor(colorScheme == .light ? Color.Light.buttonFilledTextColor : Color.Dark.buttonFilledTextColor)
            .frame(width: 56, height: 56)
            .background(
                Circle()
                    .fill(colorScheme == .light ? Color.Light.buttonFilledBackgroungColor : Color.Dark.buttonFilledBackgroungColor)

            )
    }
}

struct RoundRectTextVeiw: View {
    @Environment(\.colorScheme) var colorScheme
    var text: String

    var body: some View {
        Text(text)
            .bold()
            .font(.title3)
            .kerning(-0.2)
            .frame(width: 68, height: 56)
            .foregroundColor(colorScheme == .light ? Color.Light.textColor : Color.Dark.textColor)
            .overlay(
                RoundedRectangle(cornerRadius: 21.0)
                    .strokeBorder(lineWidth: 2.0)
                    .foregroundColor(colorScheme == .light ? Color.Light.buttonStrokeColor : Color.Dark.buttonStrokeColor)
            )
    }
}

struct PreviewView: View {
    var body: some View {
        VStack(spacing: 10) {
            RoundedImageViewStroked(systemName: "arrow.counterclockwise")
            RoundedImageViewFilled(systemName: "list.dash")
            RoundRectTextVeiw(text: "0")
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
