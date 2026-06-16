//
//  Friend.swift
//  Birthdays
//
//  Created by Evgeniy Polyak on 16.06.2026.
//
import Foundation

struct Friend: Identifiable, Equatable {
    var id: UUID
    var name: String
    var birthday: Date
    
    
    init(id: UUID = UUID(), name: String, birthday: Date) {
        self.id = id
        self.name = name
        self.birthday = birthday
    }
    
    static func == (left: Friend, right: Friend) -> Bool {
        left.name == right.name && left.birthday == right.birthday
    }
}
