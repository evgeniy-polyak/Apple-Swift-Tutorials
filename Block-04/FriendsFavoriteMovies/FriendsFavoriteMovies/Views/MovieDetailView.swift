//
//  MovieDetailView.swift
//  FriendsFavoriteMovies
//
//  Created by Evgeniy Polyak on 22.06.2026.
//

import SwiftUI

struct MovieDetailView: View {
    @Bindable var movie: Movie
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    let isNew: Bool
    
    init(movie: Movie, isNew: Bool = false) {
        self.movie = movie
        self.isNew = isNew
    }
    
    
    var body: some View {
        Form {
            TextField("Назване фильма", text: $movie.title)
            DatePicker("Дата выхода", selection: $movie.releaseDate, displayedComponents: .date)
        }
        .navigationTitle(isNew ? "New Movie" : movie.title)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            if isNew {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        context.insert(movie)
                        dismiss()
                    }
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
//                        context.delete(movie)
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    MovieDetailView(movie: SampleData.shared.movie)
}


#Preview("NavigationStack Mode") {
    NavigationStack {
        MovieDetailView(movie: SampleData.shared.movie)
    }
}

#Preview("NEW NavigationStack Mode") {
    NavigationStack {
        MovieDetailView(movie: SampleData.shared.movie, isNew: true)
    }
}

