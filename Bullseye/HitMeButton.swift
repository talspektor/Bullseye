//
//  HitMeButton.swift
//  Bullseye
//
//  Created by Tal talspektor on 16/05/2021.
//

import SwiftUI

struct HitMeButton: View {
    @Environment(\.colorScheme) var colorScheme
    @Binding var alertIsVisible: Bool
    @Binding var sliderValue: Double
    @Binding var game: Game

    var body: some View {
        Button(action: {
            alertIsVisible = true
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
        .cornerRadius(21.0)
        .overlay(
            RoundedRectangle(cornerRadius: 21.0)
                .strokeBorder(Color.white, lineWidth: 2.0)
        )
        .alert(isPresented: $alertIsVisible, content: {
            let roundedValue = Int(sliderValue.rounded())
            let points = game.points(sliderValue: roundedValue)
            return Alert(title: Text("Hello there!")
                            .foregroundColor(colorScheme == .light ? Color.Light.textColor : Color.Dark.textColor),
                         message: Text("This slider value is: \(roundedValue).\n" +
                                        "You scored \(points) points this round")
                            .foregroundColor(colorScheme == .light ? Color.Light.textColor : Color.Dark.textColor),
                         dismissButton: .default(Text("Awsome!")) {
                            game.startNewRound(points: points)
                         })
        })
    }
}

//struct HitMeButton_Previews: PreviewProvider {
//    static var previews: some View {
//        HitMeButton(alertIsVisible: .constant(false))
//    }
//}
