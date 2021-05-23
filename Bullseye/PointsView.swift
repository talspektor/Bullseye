//
//  PointsView.swift
//  Bullseye
//
//  Created by Tal talspektor on 20/05/2021.
//

import SwiftUI

struct PointsView: View {

    @Binding var alertIsVisible: Bool
    @Binding var sliderValue: Double
    @Binding var game: Game

    var body: some View {
        let roundedValue = Int(sliderValue.rounded())
        let points = game.points(sliderValue: roundedValue)
        VStack(spacing: 10) {
            InstructionText(text: "The slider's value is")
            BigNumberText(text: String(roundedValue))
            BodyText(text: "You scored \(points) Points\n🍧🍧🍧")
            Button(action: {
                withAnimation {
                    alertIsVisible = false
                }
                game.startNewRound(points: points)
            }, label: {
                ButtonText(text: "Start new Round")
            })
        }
        .padding()
        .frame(minWidth: 300)
        .background(Color.contentViewBackgroundColor)
        .cornerRadius(Constants.General.roundRectCornerRadius)
        .shadow(radius: 10, x: 5, y: 5)
        .transition(.scale)
    }
}

struct PointsView_Previews: PreviewProvider {

    static private var alertIsVisible = Binding.constant(false)
    static private var sliderValue = Binding.constant(50.0)
    static private var game = Binding.constant(Game())

    static var previews: some View {
        Group {
            PointsView(alertIsVisible: alertIsVisible, sliderValue: sliderValue, game: game)
                .preferredColorScheme(.light)
            PointsView(alertIsVisible: alertIsVisible, sliderValue: sliderValue, game: game)
                .preferredColorScheme(.dark)
        }
    }
}
