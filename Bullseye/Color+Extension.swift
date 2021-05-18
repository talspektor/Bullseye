//
//  Color+Extension.swift
//  Bullseye
//
//  Created by Tal talspektor on 16/05/2021.
//

import SwiftUI

extension Color {
    enum Light {
        static let textColor = Color(red: 25 / 255,green: 25 / 255,blue: 25 / 255)
        static let contentViewBackgroundColor = Color(red: 243 / 255, green: 248 / 255, blue: 253 / 255)

        static let buttonStrokeColor = Color(red: 192 / 255, green: 228 / 255, blue: 250 / 255)
        static let buttonFilledTextColor = Color.white
        static let buttonFilledBackgroungColor = Color(red: 25 / 255,green: 25 / 255,blue: 25 / 255)
    }
    enum Dark {
        static let textColor = Color.white
        static let contentViewBackgroundColor = Color.black

        static let buttonStrokeColor = Color.white
        static let buttonFilledTextColor = Color(red: 25 / 255,green: 25 / 255,blue: 25 / 255)
        static let buttonFilledBackgroungColor = Color.white
    }
}
