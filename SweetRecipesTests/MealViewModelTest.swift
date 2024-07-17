//
//  MealViewModelTest.swift
//  MealViewModelTest
//
//  Created by G Zhen on 7/14/24.
//

import XCTest
@testable import SweetRecipes

final class MealViewModelTest: XCTestCase {
    var mealViewModel: MealViewModel!

    override func setUp() {
        super.setUp()
        mealViewModel = MealViewModel()
    }
    
    override func tearDown() {
        super.tearDown()
        mealViewModel = nil
    }
    
    func testSanitizeMealsWithEmptyArray() {
        let meals:[Meal] = []
        
        let expectedResult = mealViewModel.sanitize(meals)
        
        XCTAssert(expectedResult.isEmpty)
    }
    
    func testSanitizeMealsWithNullValues() {
        let mealOne = Meal(idMeal: nil, strMeal: nil, strMealThumb: nil)
        let mealTwo = Meal(idMeal: "1", strMeal: "Alpha Recipe", strMealThumb: "http://simpleimage.com/images/?id=123456789")
        let mealThree = Meal(idMeal: "2", strMeal: nil, strMealThumb: "")
        let meals = [mealOne, mealTwo, mealThree]
        
        let expectedResult = mealViewModel.sanitize(meals)
        
        XCTAssertEqual(expectedResult.count, 1)
        XCTAssertEqual(expectedResult[0].idMeal, mealTwo.idMeal)
        XCTAssertEqual(expectedResult[0].strMeal, mealTwo.strMeal)
        XCTAssertEqual(expectedResult[0].strMealThumb, mealTwo.strMealThumb)
    }
    
    func testSanitizeMealsWithUnorderArray() {
        let mealOne = Meal(idMeal: nil, strMeal: nil, strMealThumb: nil)
        let mealTwo = Meal(idMeal: "2", strMeal: "Beta Recipe", strMealThumb: "")
        let mealThree = Meal(idMeal: "1", strMeal: "Alpha Recipe", strMealThumb: "http://simpleimage.com/images/?id=123456789")
        let meals = [mealOne, mealTwo, mealThree]
        
        let expectedResult = mealViewModel.sanitize(meals)
        
        XCTAssertEqual(expectedResult.count, 2)
        XCTAssertEqual(expectedResult[0].strMeal, "Alpha Recipe")
        XCTAssertEqual(expectedResult[1].strMeal, "Beta Recipe")
    }
}
