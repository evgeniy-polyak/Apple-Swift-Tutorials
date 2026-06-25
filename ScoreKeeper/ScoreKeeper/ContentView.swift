//
//  ContentView.swift
//  ScoreKeeper
//
//  Created by Evgeniy Polyak on 16.06.2026.
//

import SwiftUI

struct ContentView: View {
    @State private var scoreboard: Scoreboard = Scoreboard()
    @State private var startingPoints: Int = 0
    @State private var highestScoreWin = true

    var body: some View {
        VStack {
            Text("Score Keeper")
                .font(.title.lowercaseSmallCaps())
                .padding()

            GameSettingsView(
                startingPoints: $startingPoints,
                highestScoeWind: $highestScoreWin
            )
            .disabled(scoreboard.gameState != .setup)

            VStack(alignment: .leading) {
                Grid {
                    GridRow {
                        Text("Player")
                            .gridColumnAlignment(.leading)
                        Text("Score")
                            .opacity(scoreboard.gameState == .setup ? 0 : 1.0)
                    }
                    .font(.headline)

                    ForEach($scoreboard.players) { $player in
                        GridRow {
                            TextField("Name", text: $player.name)
                            Text("\(player.score)")
                                .opacity(
                                    scoreboard.gameState == .setup ? 0 : 1.0)
                            Stepper("", value: $player.score)
                                .labelsHidden()
                                .opacity(
                                    scoreboard.gameState == .setup ? 0 : 1.0)
                        }
                    }
                }
                .padding()

                Button {
                    withAnimation {
                        scoreboard.players.append(Player(name: "", score: 0))
                    }

                } label: {
                    HStack {
                        Image(systemName: "plus")
                        Text("Add player")
                    }.padding(5)
                }
                //                .buttonStyle(.borderedProminent)
                .padding(.top)
                .padding(.horizontal)
                .opacity(scoreboard.gameState == .setup ? 1.0 : 0)
            }

            Spacer()

            HStack {
                switch scoreboard.gameState {
                case .setup:
                    Button("Start Game", systemImage: "play.fill") {
                        scoreboard.gameState = .playing
                        scoreboard.resetScores(to: startingPoints)

                    }
                case .playing:
                    Button("End Game", systemImage: "stop.fill") {
                        scoreboard.gameState = .gameOver
                    }
                case .gameOver:
                    Button("Reset Game", systemImage: "arrow.counterclockwise")
                    {
                        scoreboard.gameState = .setup
                    }
                }
            }
            .buttonStyle(.bordered)
            .buttonBorderShape(.capsule)
            .controlSize(.large)
            .tint(.blue)

        }
        .padding(5)
    }
}

#Preview {
    ContentView()
}
