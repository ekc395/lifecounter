//
//  ContentView.swift
//  lifecounter
//
//  Created by Ethan Chen on 1/27/26.
//

import SwiftUI

struct ContentView: View {
    @State private var player1Life = 20
    @State private var player2Life = 20
    @State private var player3Life = 20
    @State private var player4Life = 20

    var body: some View {
        GeometryReader { geometry in
            VStack {
                Button("Add Player") {
                    
                }
                HStack {
                    PlayerView(
                        name: "Player 1",
                        life: $player1Life
                    )
                    .frame(width: geometry.size.width / 2)

                    PlayerView(
                        name: "Player 2",
                        life: $player2Life
                    )
                    .frame(width: geometry.size.width / 2)
                }
                HStack {
                    PlayerView(
                        name: "Player 3",
                        life: $player3Life
                    )
                    .frame(width: geometry.size.width / 2)
                    
                    PlayerView(
                        name: "Player 4",
                        life: $player4Life
                    )
                    .frame(width: geometry.size.width / 2)
                }
                Button("History") {
                    
                }

                Group {
                    if player1Life <= 0 {
                        Text("Player 1 LOSES!")
                    } else if player2Life <= 0 {
                        Text("Player 2 LOSES!")
                    } else if player3Life <= 0 {
                        Text("Player 3 LOSES!")
                    } else if player4Life <= 0 {
                        Text("Player 4 LOSES!")
                    } else {
                        Text(" ")
                    }
                }
                .frame(height: 40)
                .font(.title)
                .foregroundColor(.red)
            }
            .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
        }
    }
}

#Preview {
    ContentView()
}
