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
                NavigationLink(movie.title) {
                    Text("Detail for - \(movie.title)")
                        .navigationTitle(movie.title)
                        .navigationBarTitleDisplayMode(.inline)
                }
            }
            .navigationTitle("Movies")
        } detail: {
            Text("Select a movie")
                .navigationTitle("Movie")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    MovieListView()
        .modelContainer(SampleData.schared.modelContainer)
}
