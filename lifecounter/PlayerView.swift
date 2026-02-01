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
                    }
                    Button("+") {
                        let amount = Int(changeAmt) ?? 0
                        life += amount
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
