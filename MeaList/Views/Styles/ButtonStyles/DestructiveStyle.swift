//
//  DestructiveStyle.swift
//  MeaList
//
//  Created by Denis Kozlov on 11.07.2024.
//

import Foundation
import SwiftUI

struct DestructiveStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(8)
            .foregroundStyle(.red)
            .background(.red.opacity(0.2), in: Capsule())
            .opacity(configuration.isPressed ? 0.5 : 1)
    }
}
