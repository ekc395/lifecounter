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

    var body: some View {
        VStack(spacing: 20) {
            Text(name)
                .font(.headline)

            Text("\(life)")
                .font(.system(size: 48, weight: .bold))

            VStack(spacing: 10) {
                HStack(spacing: 10) {
                    Button("+") {
                        life += 1
                    }
                    Button("-") {
                        life -= 1
                    }
                }

                HStack(spacing: 10) {
                    Button("+5") {
                        life += 5
                    }
                    Button("-5") {
                        life -= 5
                    }
                }
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}
