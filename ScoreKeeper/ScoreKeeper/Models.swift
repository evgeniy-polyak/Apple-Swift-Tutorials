//
//  Models.swift
//  ScoreKeeper
//
//  Created by Evgeniy Polyak on 16.06.2026.
//

import Foundation

struct Player: Identifiable {
    var id: UUID
    var name: String
    var score: Int
    
    init(id: UUID = UUID(), name: String, score: Int) {
        self.id = id
        self.name = name
        self.score = score
    }
}

extension Player: Equatable {
    static func == (left: Player, right: Player) -> Bool {
        left.name == right.name && left.score == right.score
    }
}

enum GameSate {
    case setup
    case playing
    case gameOver
}


struct Scoreboard {
    var players: [Player] = [
        Player(name: "Евгений", score: 10),
        Player(name: "Жанна", score: 15),
    ]
    
    var gameState: GameSate = .setup
    var doesHighestScoreWin: Bool = true
    
    /// Определяет список победителей
    var winners: [Player] {
        // Если игра не законченна то выходим и список пуст
        guard gameState == .gameOver else { return [] }
        
        // Инициализируем переменную
        var winningScore = 0
        if doesHighestScoreWin {
            // Если побеждает те у кого больше очков от начинаем с минимального значения
            winningScore = Int.min
            for player in players { // идем по игрокам и ищем у кого больше очков
                winningScore = max(winningScore, player.score)
            }
        } else {
            // Если побеждает те у кого меньше очков от начинаем с максимального значения
            winningScore = Int.max
            for player in players { // идем по игрокам и ищем у кого меньше очков
                winningScore = min(winningScore, player.score)
            }
        }
        
        // возвращаем тех кто соответствует условию
        // если игроков с одинаково меньшим или большим кол-вом очков несколько то возвращаем всех
        return players.filter { player in
            player.score == winningScore
        }
        
    }
    
    mutating func resetScores(to newValue: Int) {
        for index in 0..<players.count {
            players[index].score = newValue
        }
    }
}
