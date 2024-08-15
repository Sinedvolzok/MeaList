//
//  MLDateLabel.swift
//  MeaList
//
//  Created by Denis Kozlov on 21.05.2024.
//

import SwiftUI

struct MLDateLabel: View {
    var weekday: String
    var day: String
    var body: some View {
        HStack {
            Text(weekday)
                .font(.headline)
            Spacer()
            Text(day)
                .font(.subheadline)
        }
    }
}
