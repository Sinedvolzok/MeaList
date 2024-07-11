//
//  GroupBoxStyle+.swift
//  MeaList
//
//  Created by Denis Kozlov on 11.07.2024.
//

import Foundation
import SwiftUI

extension GroupBoxStyle where Self == MealGroupBoxStyle {
    static var meal: Self { Self() }
}

extension GroupBoxStyle where Self == DayGroupBoxStyle {
    static var day: Self { Self() }
}
