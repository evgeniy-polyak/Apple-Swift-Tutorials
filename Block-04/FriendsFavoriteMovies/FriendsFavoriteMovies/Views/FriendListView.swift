//
//  FriendListView.swift
//  FriendsFavoriteMovies
//
//  Created by Evgeniy Polyak on 19.06.2026.
//

import SwiftData
import SwiftUI

struct FriendListView: View {
    @Query(sort: \Friend.name) private var firends: [Friend]
    @Environment(\.modelContext) private var context

    var body: some View {
        NavigationSplitView {
            List(firends) { friend in
                NavigationLink(friend.name) {
                    //                    Text(friend.name)
                    Text("Detail view for \(friend.name)")
                        .navigationTitle("\(friend.name)")
                        .navigationBarTitleDisplayMode(.inline)
                }
            }
            .navigationTitle("Friends")
        } detail: {
            Text("Select a friend")
                .navigationTitle("Friend")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    FriendListView()
        .modelContainer(SampleData.schared.modelContainer)
}
