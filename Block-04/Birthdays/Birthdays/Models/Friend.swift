//
//  Friend.swift
//  Birthdays
//
//  Created by Evgeniy Polyak on 16.06.2026.
//
import Foundation
import SwiftData

@Model
class Friend: Identifiable, Equatable {
    var id: UUID
    var name: String
    var birthday: Date
    
    
    init(id: UUID = UUID(), name: String, birthday: Date) {
        self.id = id
        self.name = name
        self.birthday = birthday
    }
    
    var isBirthdayToday: Bool {
        Calendar.current.isDateInToday(self.birthday)
    }
    
    static func == (left: Friend, right: Friend) -> Bool {
        left.name == right.name && left.birthday == right.birthday
    }
}
