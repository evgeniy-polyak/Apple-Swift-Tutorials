//
//  MovieListView.swift
//  FriendsFavoriteMovies
//
//  Created by Evgeniy Polyak on 19.06.2026.
//

import SwiftData
import SwiftUI

struct MovieListView: View {
    @Query private var movies: [Movie]
    @Environment(\.modelContext) private var context
    @State private var newMovie: Movie?

    init(titleFilter: String = "") {
        let predicate = #Predicate<Movie> { movie in
            titleFilter.isEmpty || movie.title.localizedStandardContains(titleFilter)
        }

        _movies = Query(filter: predicate, sort: \Movie.title)
    }

    var body: some View {
        List {
            ForEach(movies) { movie in
                NavigationLink(movie.title) {
                    MovieDetailView(movie: movie)
                }
            }
            .onDelete(perform: deleteMovies(indexes:))

        }
        .sheet(
            item: $newMovie,
            content: { movie in
                NavigationStack {
                    MovieDetailView(movie: movie, isNew: true)
                }
            }
        )
        .interactiveDismissDisabled()
        .navigationTitle("Movies")
        .toolbar {
            ToolbarItem {
                Button("Add movie", systemImage: "plus", action: addMovie)
            }
            ToolbarItem(placement: .topBarTrailing) {
                EditButton()
            }
        }

    }

    private func addMovie() {
        let newMovie = Movie("New Movie", date: .now)
        //        context.insert(newMovie)
        self.newMovie = newMovie
    }

    private func deleteMovies(indexes: IndexSet) {
        for index in indexes {
            context.delete(movies[index])
        }
    }
}

#Preview {
    NavigationStack {
        MovieListView()
            .modelContainer(SampleData.shared.modelContainer)
    }
}

#Preview("Filtering") {
    NavigationStack {
        MovieListView(titleFilter: "tr")
            .modelContainer(SampleData.shared.modelContainer)
    }
}
