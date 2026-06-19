//
//  MovieListView.swift
//  FriendsFavoriteMovies
//
//  Created by Evgeniy Polyak on 19.06.2026.
//

import SwiftUI
import SwiftData

struct MovieListView: View {
    @Query(sort: \Movie.title) private var movies: [Movie]
    @Environment(\.modelContext) private var context
    
    var body: some View {
        NavigationSplitView {
            List(movies) { movie in
                Text(movie.title)
            }
        }
    }
}

#Preview {
    MovieListView()
        .modelContainer(SampleData.schared.modelContainer)
}
