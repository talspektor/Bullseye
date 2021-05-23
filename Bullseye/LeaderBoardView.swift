//
//  LeaderBoardView.swift
//  Bullseye
//
//  Created by Tal talspektor on 21/05/2021.
//

import SwiftUI

struct LeaderBoardView: View {
    @Binding var leaderboardIsShowing: Bool
    @Binding var game: Game
    var body: some View {
        ZStack {
            Color.contentViewBackgroundColor
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 10) {
                HeaderView(leaderboardIsShowing: $leaderboardIsShowing)
                LabelView()
                ScrollView {
                    VStack(spacing: 10) {
                        ForEach(game.leaderboardEntries.indices) { i in
                            let leaderboardEntry = game.leaderboardEntries[i]
                            RowView(index: i, score: leaderboardEntry.score,
                                    date: leaderboardEntry.date)
                        }
                    }
                }
            }
        }
    }
}

struct RowView: View {
    let index: Int
    let score: Int
    let date: Date
    var body: some View {
        HStack {
            RoundedTextView(text: String(index))
            Spacer()
            ScoreText(score: score)
                .frame(width: Constants.LeaderBoard.leaderBoardScareColWidth)
            Spacer()
            DateText(date: date)
                .frame(width: Constants.LeaderBoard.leaderBoardDateColWidth)

        }
        .background(
            RoundedRectangle(cornerRadius: .infinity)
                .strokeBorder(Color.leaderBoardRowColor,
                              lineWidth: Constants.General.strokeWidth
                )
        )
        .padding(.leading)
        .padding(.trailing)
        .frame(minWidth: Constants.LeaderBoard.leaderBoardMaxRowWidth)
    }
}

struct HeaderView: View {
    @Binding var leaderboardIsShowing: Bool
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Environment(\.horizontalSizeClass) var horizontalSizeClass

    var body: some View {
        ZStack {
            HStack {
                if verticalSizeClass == .regular && horizontalSizeClass == .compact {
                    BigBoldText(text: "LeaderBoard")
                        .padding(.leading)
                    Spacer()
                } else {
                    BigBoldText(text: "LeaderBoard")
                }
            }
            .padding(.top)
            HStack {
                Spacer()
                Button(action: {
                        leaderboardIsShowing = false
                    }, label: {
                        RoundedImageViewFilled(systemName: "xmark")
                            .padding(.trailing)
                })
            }
        }
        .padding(.top)
    }
}

struct LabelView: View {
    var body: some View {
        HStack {
            Spacer()
                .frame(width: Constants.General.roundViewLength)
            Spacer()
            LabelText(text: "Score")
                .frame(width: Constants.LeaderBoard.leaderBoardScareColWidth)
            Spacer()
            LabelText(text: "Date")
                .frame(width: Constants.LeaderBoard.leaderBoardDateColWidth)
        }
        .padding(.leading)
        .padding(.trailing)
        .frame(minWidth: Constants.LeaderBoard.leaderBoardMaxRowWidth)
    }
}

struct LeaderBoardView_Previews: PreviewProvider {
    static private var leaderboardIsShowing = Binding.constant(false)
    static private var game = Binding.constant(Game(loadTestData: true))
    static var previews: some View {
        Group {
            LeaderBoardView(leaderboardIsShowing: leaderboardIsShowing, game: game)
                .preferredColorScheme(.light)
            LeaderBoardView(leaderboardIsShowing: leaderboardIsShowing, game: game)
                .preferredColorScheme(.dark)
        }
        LeaderBoardView(leaderboardIsShowing: leaderboardIsShowing, game: game)
            .preferredColorScheme(.light)
        LeaderBoardView(leaderboardIsShowing: leaderboardIsShowing, game: game)
            .previewLayout(.fixed(width: 568, height: 320))
        LeaderBoardView(leaderboardIsShowing: leaderboardIsShowing, game: game)
            .previewLayout(.fixed(width: 568, height: 320))
            .preferredColorScheme(.dark)
    }
}
