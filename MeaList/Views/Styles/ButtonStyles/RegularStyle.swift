//
//  RegularStyle.swift
//  MeaList
//
//  Created by Denis Kozlov on 11.07.2024.
//

import Foundation
import SwiftUI

struct RegularStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(8)
            .background(Color(UIColor.quaternarySystemFill), in: Capsule())
            .opacity(configuration.isPressed ? 0.5 : 1)
    }
}
