//
//  FriendDetailView.swift
//  FriendsFavoriteMovies
//
//  Created by Evgeniy Polyak on 22.06.2026.
//

import SwiftUI
import SwiftData

struct FriendDetailView: View {
    @Bindable var friend: Friend
    let isNew: Bool
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    
    @Query(sort: \Movie.title) private var movies: [Movie]
    
    init(friend: Friend, isNew: Bool = false) {
        self.friend = friend
        self.isNew = isNew
    }
    
    var body: some View {
        Form {
            TextField("Name", text: $friend.name)
                .autocorrectionDisabled()
            
            Picker("Favorite Movie:", selection: $friend.favoriteMovie) {
                Text("None").tag(nil as Movie?)
                ForEach(movies) { movie in
                    Text(movie.title).tag(movie)
                }
            }
        }
        .navigationTitle(isNew ? "New Friend" : "\(friend.name)")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            if isNew {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        context.insert(friend)
                        dismiss()
                    }
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        //context.delete(friend)
                        dismiss()
                    }
                }
            }
        }
    }
}



#Preview("Navigation Stack") {
    NavigationStack {
        FriendDetailView(friend: SampleData.shared.friend)
    }
    .modelContainer(SampleData.shared.modelContainer)
}

#Preview("NEW Navigation Stack") {
    NavigationStack {
        FriendDetailView(friend: SampleData.shared.friend, isNew: true)
    }
}
