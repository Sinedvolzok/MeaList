//
//  MokedData.swift
//  MeaList
//
//  Created by Denis Kozlov on 13.05.2024.
//

import Foundation

extension MLMeal {
    static let mockedData: [MLMeal] = [
        MLMeal(dateId: "24_06_17", type: .lunch, dish: MLDish(title:    "Palack Panir")),
        MLMeal(dateId: "24_06_17", type: .breakfast, dish: MLDish(title: "Broccoli With Veal")),
        MLMeal(dateId: "24_06_17", type: .lunch, dish: MLDish(title:     "Avocado Sanwiches")),
        MLMeal(dateId: "24_06_17", type: .lunch, dish: MLDish(title:     "Palack Panir")),
        MLMeal(dateId: "24_06_17", type: .lunch, dish: MLDish(title:    "Palack Panir")),
        MLMeal(dateId: "24_06_17", type: .breakfast, dish: MLDish(title: "Vegetable Stew")),
        MLMeal(dateId: "24_06_17", type: .elevenses, dish: MLDish(title: "Palack Panir")),
        MLMeal(dateId: "24_06_17", type: .elevenses, dish: MLDish(title: "Vegetable Stew")),
    ]
    static let mockedData2: [MLMeal] = [
        MLMeal(dateId: "22_05_23", type: .dinner, dish: MLDish(title:    "Palack Panir")),
        MLMeal(dateId: "22_06_10", type: .breakfast, dish: MLDish(title: "Broccoli With Veal")),
        MLMeal(dateId: "22_06_10", type: .lunch, dish: MLDish(title:     "Avocado Sanwiches")),
        MLMeal(dateId: "24_05_20", type: .lunch, dish: MLDish(title:     "Palack Panir")),
        MLMeal(dateId: "24_05_20", type: .dinner, dish: MLDish(title:    "Palack Panir")),
        MLMeal(dateId: "22_06_05", type: .breakfast, dish: MLDish(title: "Vegetable Stew")),
        MLMeal(dateId: "22_06_05", type: .elevenses, dish: MLDish(title: "Palack Panir")),
        MLMeal(dateId: "22_06_05", type: .elevenses, dish: MLDish(title: "Vegetable Stew")),
    ]
}

extension MLDish {
    static let mockedData: [MLDish] = [
        MLDish(title: "Palack Panir"),
        MLDish(title: "Broccoli With Veal"),
        MLDish(title: "Avocado Sanwiches"),
        MLDish(title: "Vegetable Stew"),
        MLDish(title: "Pasta Balanese"),
    ]
}
