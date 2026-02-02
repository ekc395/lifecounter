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
    @State private var gameOver = false
    
    var activePlayers: [Int] {
        players.indices.filter { index in
            players[index] > 0
        }
    }
    
    func resetGame() {
        players = Array(repeating: 20, count: 4)
        gameStarted = false
        history = []
    }
    
    var body: some View {
        NavigationView {
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
                            if activePlayers.count == 1 {
                                gameOver = true
                            }
                        }
                    }
                    NavigationLink("History") {
                        HistoryView(history: history)
                    }
                    Button("Reset") {
                        resetGame()
                    }
                }
            }
        }
        .sheet(isPresented: $gameOver) {
            VStack(spacing: 20) {
                Text("Game Over!")
                    .font(.title)
                    .bold()
                Button("OK") {
                    gameOver = false
                }
                .buttonStyle(.borderedProminent)
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
