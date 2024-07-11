//
//  ButtonStyle+.swift
//  MeaList
//
//  Created by Denis Kozlov on 11.07.2024.
//

import Foundation
import SwiftUI

extension ButtonStyle where Self == DestructiveStyle {
    static var destructive: Self { Self() }
}

extension ButtonStyle where Self == RegularStyle {
    static var regular: Self { Self() }
}
