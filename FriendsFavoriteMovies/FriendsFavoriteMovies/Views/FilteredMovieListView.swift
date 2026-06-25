//
//  FilteredMovieListView.swift
//  FriendsFavoriteMovies
//
//  Created by Евгений Поляк on 23.06.2026.
//

import SwiftUI

struct FilteredMovieListView: View {
    @State private var searchText: String = ""
    var body: some View {
        NavigationSplitView {
            MovieListView(titleFilter: searchText)
                .searchable(text: $searchText)
        } detail: {
            Text("Select a movie")
                .navigationTitle("Movie")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    FilteredMovieListView()
        .modelContainer(SampleData.shared.modelContainer)
}
