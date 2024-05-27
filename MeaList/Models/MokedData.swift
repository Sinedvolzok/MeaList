//
//  MokedData.swift
//  MeaList
//
//  Created by Denis Kozlov on 13.05.2024.
//

import Foundation

extension MLMeal {
    static let mockedData: [MLMeal] = [
        MLMeal(dateId: "20_05_10", type: .dinner),
        MLMeal(dateId: "20_05_10", type: .breakfast),
        MLMeal(dateId: "20_05_10", type: .lunch),
        MLMeal(dateId: "20_05_11", type: .lunch),
        MLMeal(dateId: "20_05_11", type: .dinner),
        MLMeal(dateId: "20_05_12", type: .breakfast),
        MLMeal(dateId: "20_05_13", type: .elevenses),
        MLMeal(dateId: "20_05_13", type: .elevenses),
    ]
    static let mockedData2: [MLMeal] = [
        MLMeal(dateId: "22_05_23", type: .dinner),
        MLMeal(dateId: "22_06_10", type: .breakfast),
        MLMeal(dateId: "22_06_10", type: .lunch),
        MLMeal(dateId: "24_05_20", type: .lunch),
        MLMeal(dateId: "24_05_20", type: .dinner),
        MLMeal(dateId: "22_06_12", type: .breakfast),
        MLMeal(dateId: "22_06_13", type: .elevenses),
        MLMeal(dateId: "22_06_13", type: .elevenses),
    ]
}

extension MLDish {
    static let mockedData: [MLDish] = [
        MLDish(
            mealId: UUID(
                uuidString:
                    "AC5069FE-15D8-40F0-8BC5-CC2FD0FCE4E6")!,
            title: "Palack Panir"),
        MLDish(
            mealId: UUID(
                uuidString:
                    "75F2330F-966F-49BA-B5C8-C860E21F6F9A")!,
            title: "Broccoli With Veal"),
        MLDish(
            mealId: UUID(
                uuidString:
                    "75F2330F-966F-49BA-B5C8-C860E21F6F9A")!,
            title: "Avocado Sanwiches"),
        MLDish(
            mealId: UUID(
                uuidString:
                    "75F2330F-966F-49BA-B5C8-C860E21F6F9A")!,
            title: "Vegetable Stew"),
        MLDish(
            mealId: UUID(
                uuidString:
                    "17EC96AA-A6F9-4174-8D70-AE1159BC672D")!,
            title: "Pasta Balanese"),
    ]
}
