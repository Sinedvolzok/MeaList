//
//  MLMealTests.swift
//  MeaListTests
//
//  Created by Denis Kozlov on 14.05.2024.
//

import XCTest
@testable import MeaList

final class MLMealTests: XCTestCase {
    var meal: MLMeal!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        let id = UUID(uuidString: "75F2330F-966F-49BA-B5C8-C860E21F6F9A")!
        meal = MLMeal(id: id, dateId: "20_05_10", type: .breakfast, dish: MLDish(title: "BBB"))
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        meal = nil
    }

    func testDishesGotten() throws {
        let testMeals = [
            "Broccoli With Veal",
            "Avocado Sanwiches",
            "Vegetable Stew",
        ]
        let sut = meal.dish
        
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
