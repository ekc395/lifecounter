//
//  HistoryView.swift
//  lifecounter
//
//  Created by Ethan Chen on 1/30/26.
//

import SwiftUI

struct HistoryView: View {
    let history: [String]
    
    var body: some View {
        List(history, id: \.self) { event in
            Text(event)
        }
        .navigationTitle("History")
    }
}
