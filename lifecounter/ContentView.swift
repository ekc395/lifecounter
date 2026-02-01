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

    var body: some View {
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
                            life: $players[index]
                        )
                        .onChange(of: players[index]) {
                            gameStarted = true
                        }
                    }
                    Button("History") {
                        
                    }

//                    Group {
//                        if player1Life <= 0 {
//                            Text("Player 1 LOSES!")
//                        } else if player2Life <= 0 {
//                            Text("Player 2 LOSES!")
//                        } else if player3Life <= 0 {
//                            Text("Player 3 LOSES!")
//                        } else if player4Life <= 0 {
//                            Text("Player 4 LOSES!")
//                        } else {
//                            Text(" ")
//                        }
//                    }
//                    .frame(height: 40)
//                    .font(.title)
//                    .foregroundColor(.red)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
