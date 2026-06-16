//
//  ContentView.swift
//  ScoreKeeper
//
//  Created by Evgeniy Polyak on 16.06.2026.
//

import SwiftUI

struct ContentView: View {
    @State private var playerList: [Player] = [
        Player(name: "Евгений", score: 10),
        Player(name: "Жанна", score: 15),
    ]
//    @State private var newPlayer: Player? = nil

    var body: some View {
        VStack {
            Text("Score Keeper")
                .font(.title.lowercaseSmallCaps())
                .padding()
            
            Grid {
                GridRow {
                    Text("Player")
                        .gridColumnAlignment(.leading)
                    Text("Score")
                }
                .font(.headline)
                
                ForEach($playerList) { $player in
                    GridRow {
                        TextField("Name", text: $player.name)
                        Text("\(player.score)")
                        Stepper("", value: $player.score)
                            .labelsHidden()
                    }
                }
                Spacer()
            }
            .padding()
            .background(.secondary.opacity(0.1))
            
            
            
            Button {
                withAnimation {
                    playerList.append(Player(name: "", score: 0))
                }
                
            } label: {
                HStack {
                    Image(systemName: "plus")
                    Text("Add player")
                }.padding(5)
            }
            .buttonStyle(.borderedProminent)
            .padding(.top)
        }
        .padding(5)
    }
}

#Preview {
    ContentView()
}
