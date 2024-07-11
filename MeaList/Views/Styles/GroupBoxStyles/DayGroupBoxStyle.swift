//
//  DayGroupBoxStyle.swift
//  MeaList
//
//  Created by Denis Kozlov on 11.07.2024.
//

import Foundation
import SwiftUI

struct DayGroupBoxStyle: GroupBoxStyle {
    func makeBody(configuration: Configuration) -> some View {
        VStack(alignment: .leading) {
            configuration.label
                .padding(.top)
                .foregroundColor(.secondary)
            VStack(alignment: .leading) {
                configuration.content
            }
            .padding()
            .background(
                Color(
                    UIColor.secondarySystemBackground))
            .clipShape(RoundedRectangle(cornerRadius: 28, style: .continuous))
        }
        .padding(.leading)
        .padding(.trailing)
    }
}
