//
//  MLDish.swift
//  MeaList
//
//  Created by Denis Kozlov on 15.05.2024.
//

import Foundation

struct MLDish {
    let id: UUID
    let mealId: UUID
    let title: String
    init(id: UUID = UUID(), mealId: UUID = UUID(), title: String) {
        self.id = id
        self.mealId = mealId
        self.title = title
    }
}
