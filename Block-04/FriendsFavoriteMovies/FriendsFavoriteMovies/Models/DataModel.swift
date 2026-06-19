//
//  DataModel.swift
//  FriendsFavoriteMovies
//
//  Created by Evgeniy Polyak on 19.06.2026.
//
import SwiftData
import Foundation

@Model
class Friend {
    var name: String
    
    init(_ name: String) {
        self.name = name
        
    }
}


@Model
class Movie {
    var title: String
    var releaseDate: Date
    
    init(_ title: String, date: Date) {
        self.title = title
        self.releaseDate = date
        
    }
}
