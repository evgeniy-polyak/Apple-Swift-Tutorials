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
    static let schared = SampleData()

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
        for friend in SampleData.sampleFriendData {
            context.insert(friend)
        }
        for movie in SampleData.sampleMovieData {
            context.insert(movie)
        }
    }
}
