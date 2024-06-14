//
//  MokedData.swift
//  MeaList
//
//  Created by Denis Kozlov on 13.05.2024.
//

import Foundation

extension MLMeal {
    static let mockedData: [MLMeal] = [
        MLMeal(dateId: "20_05_10", type: .dinner, dishes: MLDish.mockedData),
        MLMeal(dateId: "20_05_10", type: .breakfast, dishes: MLDish.mockedData),
        MLMeal(dateId: "20_05_10", type: .lunch, dishes: MLDish.mockedData),
        MLMeal(dateId: "20_05_11", type: .lunch, dishes: MLDish.mockedData),
        MLMeal(dateId: "20_05_11", type: .dinner, dishes: MLDish.mockedData),
        MLMeal(dateId: "20_05_12", type: .breakfast, dishes: MLDish.mockedData),
        MLMeal(dateId: "20_05_13", type: .elevenses, dishes: MLDish.mockedData),
        MLMeal(dateId: "20_05_13", type: .elevenses, dishes: MLDish.mockedData),
    ]
    static let mockedData2: [MLMeal] = [
        MLMeal(dateId: "22_05_23", type: .dinner, dishes: MLDish.mockedData),
        MLMeal(dateId: "22_06_10", type: .breakfast, dishes: MLDish.mockedData),
        MLMeal(dateId: "22_06_10", type: .lunch, dishes: MLDish.mockedData),
        MLMeal(dateId: "24_05_20", type: .lunch, dishes: MLDish.mockedData),
        MLMeal(dateId: "24_05_20", type: .dinner, dishes: MLDish.mockedData),
        MLMeal(dateId: "22_06_05", type: .breakfast, dishes: MLDish.mockedData),
        MLMeal(dateId: "22_06_05", type: .elevenses, dishes: MLDish.mockedData),
        MLMeal(dateId: "22_06_05", type: .elevenses, dishes: MLDish.mockedData),
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
