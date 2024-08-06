//
//  MLDish.swift
//  MeaList
//
//  Created by Denis Kozlov on 15.05.2024.
//

import Foundation

struct MLDish: Identifiable {
    let id: UUID
    var title: String
    init(id: UUID = UUID(), title: String) {
        self.id = id
        self.title = title
    }
}
