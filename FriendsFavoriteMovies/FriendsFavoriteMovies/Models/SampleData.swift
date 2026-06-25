//
//  SampleData.swift
//  FriendsFavoriteMovies
//
//  Created by Evgeniy Polyak on 19.06.2026.
//
import Foundation
import SwiftData

@MainActor
class SampleData {
    static let shared = SampleData()

    static private let sampleFriendData = [
        Friend("Евгений"),
        Friend("Жанна"),
        Friend("Анна"),
    ]

    static private let sampleMovieData = [
        Movie("Amusing Space Traveler 3", date: Date(timeIntervalSinceReferenceDate: -402_000_000)),
        Movie("Difficult Cat", date: Date(timeIntervalSinceReferenceDate: -20_000_000)),
        Movie("Electrifying Trek", date: Date(timeIntervalSinceReferenceDate: 300_000_000)),
        Movie("Reckless Train Ride 2", date: Date(timeIntervalSinceReferenceDate: 120_000_000)),
        Movie("The Last Venture", date: Date(timeIntervalSinceReferenceDate: 550_000_000)),
        Movie("Glamorous Neighbor", date: Date(timeIntervalSinceReferenceDate: -1_700_000_000)),
    ]

    let modelContainer: ModelContainer

    var context: ModelContext {
        self.modelContainer.mainContext
    }
    
    var friend: Friend {
        SampleData.sampleFriendData.first!
    }
    
    var movie: Movie {
        SampleData.sampleMovieData.first!
    }

    private init() {
        let schema = Schema([
            Friend.self,
            Movie.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: true)

        do {
            self.modelContainer = try ModelContainer(for: schema, configurations: [modelConfiguration])
            self.insertSampleData()

            try context.save()
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }

    private func insertSampleData() {
        let movieCount = SampleData.sampleMovieData.count
        let friendCount = SampleData.sampleFriendData.count
        
        
        for index in 0..<friendCount {
            let friend = SampleData.sampleFriendData[index]
            let movie = SampleData.sampleMovieData[index]
            
            friend.favoriteMovie = movie
            context.insert(friend)
        }
        
        for movie in SampleData.sampleMovieData {
            context.insert(movie)
        }
    }
}
