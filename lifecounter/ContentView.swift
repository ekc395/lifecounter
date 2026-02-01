//
//  ContentView.swift
//  lifecounter
//
//  Created by Ethan Chen on 1/27/26.
//

import SwiftUI

struct ContentView: View {
    @State private var players: [Int] = Array(repeating: 20, count: 4)
    @State private var gameStarted = false
    @State private var history: [String] = []

    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ScrollView {
                    VStack {
                        Button("Add Player") {
                            if players.count < 8 {
                                players.append(20)
                            }
                        }
                        .disabled(gameStarted)
                        ForEach(players.indices, id: \.self) { index in
                            PlayerView(
                                name: "Player \(index + 1)",
                                life: $players[index],
                                history: $history
                            )
                            .onChange(of: players[index]) {
                                gameStarted = true
                            }
                        }
                        NavigationLink("History") {
                            HistoryView(history: history)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
