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
