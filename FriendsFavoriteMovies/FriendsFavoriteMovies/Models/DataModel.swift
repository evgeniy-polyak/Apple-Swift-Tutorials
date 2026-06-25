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
    var favoriteMovie: Movie?
    
    var title: String {
        favoriteMovie == nil ? name: "\(name) - \(favoriteMovie!.title)"
    }
    
    init(_ name: String) {
        self.name = name
        
    }
}


@Model
class Movie {
    var title: String
    var favoritedBy: [Friend] = [Friend]()
    var releaseDate: Date
    
    init(_ title: String, date: Date) {
        self.title = title
        self.releaseDate = date
        
    }
}
