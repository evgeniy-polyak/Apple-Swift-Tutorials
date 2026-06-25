//
//  GameSettingsView.swift
//  ScoreKeeper
//
//  Created by Evgeniy Polyak on 16.06.2026.
//

import SwiftUI

struct GameSettingsView: View {
    @Binding var startingPoints: Int
    @Binding var highestScoeWind: Bool
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Game Settings")
                .font(.headline)
            
            Divider()
            
            Picker("Win conditions", selection: $highestScoeWind) {
                Text("Highest score winner").tag(true)
                Text("Lowest score winner").tag(false)
            }
            
            Picker("Starting points", selection: $startingPoints) {
                Text("0 starting points").tag(0)
                Text("10 starting points").tag(10)
                Text("20 starting points").tag(20)
            }
        }
        .padding()
        .background(.thinMaterial, in: .rect(cornerRadius: 10.0))
    }
}

#Preview {
    @Previewable @State var startingPoints = 10
    @Previewable @State var highestScoeWind = true
    GameSettingsView(startingPoints: $startingPoints, highestScoeWind: $highestScoeWind)
}
