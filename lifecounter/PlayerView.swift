//
//  PlayerView.swift
//  lifecounter
//
//  Created by Ethan Chen on 1/27/26.
//

import SwiftUI

struct PlayerView: View {
    let name: String
    @Binding var life: Int
    @State private var changeAmt = ""
    @Binding var history: [String]

    var body: some View {
        VStack(spacing: 20) {
            Text(name)
                .font(.headline)

            Text("\(life)")
                .font(.system(size: 48, weight: .bold))

            VStack(spacing: 10) {
                HStack(spacing: 10) {
                    Button("-") {
                        let amount = Int(changeAmt) ?? 0
                        life -= amount
                        history.append("\(name) lost \(amount) life")
                    }
                    Button("+") {
                        let amount = Int(changeAmt) ?? 0
                        life += amount
                        history.append( "\(name) gained \(amount) life")
                    }
                }

                HStack(spacing: 10) {
                    TextField(
                        "Change amount",
                        text: $changeAmt
                    )
                    .multilineTextAlignment(.center)
                }
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}
