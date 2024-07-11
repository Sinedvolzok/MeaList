//
//  MealGroupBoxStyle.swift
//  MeaList
//
//  Created by Denis Kozlov on 11.07.2024.
//

import Foundation
import SwiftUI

struct MealGroupBoxStyle: GroupBoxStyle {
    func makeBody(configuration: Configuration) -> some View {
        VStack(alignment: .leading) {
            configuration.label
                .padding(.top, 8)
                .foregroundColor(.secondary)
            VStack(alignment: .leading, spacing: 2) {
                configuration.content
            }
            .padding()
            .background(
                Color(
                    UIColor.tertiarySystemBackground))
            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
            .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(.secondary, lineWidth: 0.5)
                )
            .shadow(color: .black.opacity(0.1), radius: 8.0, x: 4.0, y: 8.0)
        }
    }
}

