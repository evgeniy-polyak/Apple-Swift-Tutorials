//
//  ScoreKeeperTests.swift
//  ScoreKeeperTests
//
//  Created by Evgeniy Polyak on 16.06.2026.
//

import Testing

@testable import ScoreKeeper

struct ScoreKeeperTests {

    @Test("Scoreboard - resetScores - Test", arguments: [0, 10, 20])
    func scoreboard_resetScores_Test(to newValue: Int) async throws {
        var scoreboard = Scoreboard(players: [
            Player(name: "Тест юзер 1", score: 10),
            Player(name: "Тест юзер 2", score: 15),
            Player(name: "Тест юзер 3", score: 25),
        ])

        scoreboard.resetScores(to: newValue)

        for player in scoreboard.players {
            #expect(player.score == newValue)
        }
    }

    @Test("Scoreboard - Highest Score Win - Test")
    func scoreboard_highetScoreWin_Test() async throws {
        let scoreboard = Scoreboard(
            players: [
                Player(name: "Тест юзер 1", score: 10),
                Player(name: "Тест юзер 2", score: 15),
                Player(name: "Тест юзер 3", score: 25),
            ],
            gameState: .gameOver,
            doesHighestScoreWin: true
            
        )
        
        let winners = scoreboard.winners
        for winner in winners {
            #expect(winner == scoreboard.players[2])
        }
    }
    
    @Test("Scoreboard - Lowest Score Win - Test")
    func scoreboard_lowestScoreWin_Test() async throws {
        let scoreboard = Scoreboard(
            players: [
                Player(name: "Тест юзер 1", score: 10),
                Player(name: "Тест юзер 2", score: 15),
                Player(name: "Тест юзер 3", score: 25),
            ],
            gameState: .gameOver,
            doesHighestScoreWin: false
            
        )
        
        let winners = scoreboard.winners
        for winner in winners {
            #expect(winner == scoreboard.players[0])
        }
    }

}
