//
//  BackgroundView.swift
//  Bullseye
//
//  Created by Tal talspektor on 17/05/2021.
//

import SwiftUI

struct BackgroundView: View {
    @Binding var game: Game

    var body: some View {
        VStack {
            TopView(game: $game)
            Spacer()
            BottomView(game: $game)
        }
        .padding()
        .background(
            RingsView()
        ).edgesIgnoringSafeArea(.all)
    }
}

struct TopView: View {
    @Binding var game: Game
    @State private var leaderboardIsShowing = false

    var body: some View {
        HStack {
            Button(action: {
                game.restart()
            }, label: {
                RoundedImageViewStroked(systemName: "arrow.counterclockwise")
            })
            Spacer()
            Button(action: {
                leaderboardIsShowing = true
            }, label: {
                RoundedImageViewFilled(systemName: "list.dash")
            }).sheet(isPresented: $leaderboardIsShowing, onDismiss: {}, content: {
                LeaderBoardView(leaderboardIsShowing: $leaderboardIsShowing, game: $game)
            })

        }
    }
}

struct NumberView: View {
    var title: String
    var text: String

    var body: some View {
        VStack(spacing: 5) {
            LabelText(text: title.uppercased())
            RoundRectTextVeiw(text: text)
        }
    }
}

struct BottomView: View {
    @Binding var game: Game

    var body: some View {
        HStack {
            NumberView(title: "Score", text: String(game.score))
            Spacer()
            NumberView(title: "Round", text: String(game.round))
        }
    }
}

struct RingsView: View {
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        ZStack {
            Color.contentViewBackgroundColor
                .edgesIgnoringSafeArea(.all)
            ForEach(1..<6) { ring in
                let opacity = colorScheme == .dark ? 0.1 : 0.3
                Circle()
                    .stroke(lineWidth: 20.0)
                    .fill(
                        RadialGradient(
                            gradient: Gradient(colors: [Color.ringColor.opacity(opacity * 0.8),
                                                        Color.ringColor.opacity(0)]
                            ),
                            center: .center,
                            startRadius: 100,
                            endRadius: 300)
                    )
                    .frame(width: CGFloat(ring) * 100.0, height: CGFloat(ring) * 100.0)

            }

        }
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView(game: .constant(Game()))
    }
}
