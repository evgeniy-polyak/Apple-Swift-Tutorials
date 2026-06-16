//
//  ContentView.swift
//  Birthdays
//
//  Created by Evgeniy Polyak on 16.06.2026.
//

import SwiftUI

struct ContentView: View {
    @State private var friends: [Friend] = [
        Friend(name: "Евгений", birthday: .now),
        Friend(name: "Жанна", birthday: Date(timeIntervalSince1970: 0)),
    ]
    
    @State private var newName: String = ""
    @State private var newBirthday: Date = .now
    
    var body: some View {
        NavigationStack {
            List($friends) { $friend in
                HStack {
                    Text(friend.name)
                    Spacer()
                    Text(friend.birthday, format: .dateTime.year().month(.twoDigits).day(.twoDigits))
                }
            }
            .navigationTitle("Birthdays")
            .safeAreaInset(edge: .bottom) {
                VStack(spacing: 20) {
                    Text("New birthday")
                        .font(.headline)
                    DatePicker(selection: $newBirthday, in: Date.distantPast...Date.now, displayedComponents: .date) {
                        TextField("Name", text: $newName)
                            .textFieldStyle(.roundedBorder)
                    }
                    Button("Save") {
                        let newFriend = Friend(name: newName, birthday: newBirthday)
                        friends.append(newFriend)
                        newName = ""
                        newBirthday = .now
                    }.bold()
                }
                .padding()
                .background(.bar)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
