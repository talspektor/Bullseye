//
//  HitMeButton.swift
//  Bullseye
//
//  Created by Tal talspektor on 16/05/2021.
//

import SwiftUI

struct HitMeButton: View {
    @Binding var alertIsVisible: Bool
    @Binding var sliderValue: Double
    @Binding var game: Game

    var body: some View {
        Button(action: {
            withAnimation {
                alertIsVisible = true
            }
        }) {
            Text("Hit me".uppercased())
                .bold()
                .font(.title3)
                .foregroundColor(Color.white)
        }
        .padding(20.0)
        .background(
            ZStack {
                Color.blue
                LinearGradient(
                    gradient: Gradient(
                        colors: [Color.white.opacity(0.3),
                                 Color.clear]
                    ),
                    startPoint: .top, endPoint: .bottom
                )
            }
        )
        .foregroundColor(Color.white)
        .cornerRadius(Constants.General.roundRectCornerRadius)
        .overlay(
            RoundedRectangle(cornerRadius: Constants.General.roundRectCornerRadius)
                .strokeBorder(Color.white, lineWidth: Constants.General.strokeWidth)
        )
    }
}

//struct HitMeButton_Previews: PreviewProvider {
//    static var previews: some View {
//        HitMeButton(alertIsVisible: .constant(false))
//    }
//}
