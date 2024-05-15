//
//  MLMealTests.swift
//  MeaListTests
//
//  Created by Denis Kozlov on 14.05.2024.
//

import XCTest
@testable import MeaList

final class MLMealTests: XCTestCase {
    
    

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testDishesGotten() throws {
        let id = UUID(uuidString: "75F2330F-966F-49BA-B5C8-C860E21F6F9A")!
        let meal = MLMeal(id: id, dateId: "20_05_10", type: .breakfast)
        let sut = meal.getDishes(from: MLDish.mockedData).first!
        XCTAssertEqual("Broccoli with veal", sut.title)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
