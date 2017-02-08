//
//  TriangleTests.swift
//  TriangleTests
//
//  Created by Dan Esrey on 2017/20/01.
//  Copyright © 2017 Dan Esrey. All rights reserved.
//

import XCTest
@testable import Triangle

class TriangleTests: XCTestCase {
    let isosceles = "Isosceles"
    let equilateral = "Equilateral"
    let scalene = "Scalene"
    let errorMessage = "this triangle cannot exist"
    
    func testTriangleInitialization() {
        let potentialTriangle = Triangle(3, 3, 3)
        XCTAssertNotNil(potentialTriangle)
    }
    
    func testEquilateral() {
        let equilateralCase1 = Triangle(3, 3, 3)
        let equilateralCase2 = Triangle(4, 4, 4)
        let equilateralCase3 = Triangle(99, 99, 99)
        let equilateralCase4 = Triangle(101, 101, 101)
        XCTAssertEqual(equilateralCase1.isTriangle(equilateralCase1), equilateral)
        XCTAssertEqual(equilateralCase2.isTriangle(equilateralCase2), equilateral)
        XCTAssertEqual(equilateralCase3.isTriangle(equilateralCase3), equilateral)
        XCTAssertEqual(equilateralCase4.isTriangle(equilateralCase4), equilateral)
    }
    
    func testNotEquilateral() {
        let triangle = Triangle(3, 3, 5)
        XCTAssertNotEqual(triangle.isTriangle(triangle), equilateral)
    }
    
    func testIsosceles() {
        let isoscelesCase1 = Triangle(3, 3, 4)
        let isoscelesCase2 = Triangle(3, 4, 3)
        let isoscelesCase3 = Triangle(4, 3, 3)
        let isoscelesCase4 = Triangle(5, 5, 6)
        let isoscelesCase5 = Triangle(7, 4, 4)
        let isoscelesCase6 = Triangle(7, 4, 7)
        XCTAssertEqual(isoscelesCase1.isTriangle(isoscelesCase1), isosceles)
        XCTAssertEqual(isoscelesCase2.isTriangle(isoscelesCase2), isosceles)
        XCTAssertEqual(isoscelesCase3.isTriangle(isoscelesCase3), isosceles)
        XCTAssertEqual(isoscelesCase4.isTriangle(isoscelesCase4), isosceles)
        XCTAssertEqual(isoscelesCase5.isTriangle(isoscelesCase5), isosceles)
        XCTAssertEqual(isoscelesCase6.isTriangle(isoscelesCase6), isosceles)
    }
    
    func testScalene() {
        let scaleneCase1 = Triangle(3, 4, 5)
        let scaleneCase2 = Triangle(2, 4, 5)
        let scaleneCase3 = Triangle(2, 3, 4)
        let scaleneCase4 = Triangle(10, 15, 20)
        XCTAssertEqual(scaleneCase1.isTriangle(scaleneCase1), scalene)
        XCTAssertEqual(scaleneCase2.isTriangle(scaleneCase2), scalene)
        XCTAssertEqual(scaleneCase3.isTriangle(scaleneCase3), scalene)
        XCTAssertEqual(scaleneCase4.isTriangle(scaleneCase4), scalene)
    }
    
    func testOneSideGreaterThanSumOfRemainingSides() {
        let sideAGreater = Triangle(100, 3, 4)
        let sideBGreater = Triangle(2, 100, 4)
        let sideCGreater = Triangle(2, 3, 7)
        let sideCGreaterAndRemainingSidesEqual = Triangle(3, 3, 7)
        XCTAssertEqual(sideAGreater.isTriangle(sideAGreater), errorMessage)
        XCTAssertEqual(sideBGreater.isTriangle(sideBGreater), errorMessage)
        XCTAssertEqual(sideCGreater.isTriangle(sideCGreater), errorMessage)
        XCTAssertEqual(sideCGreaterAndRemainingSidesEqual.isTriangle(sideCGreaterAndRemainingSidesEqual), errorMessage)
    }
    
    func testOneSideEqualsSumOfRemainingSides() {
        let sideCEqualsSumOfRemainingSides = Triangle(3, 3, 6)
        let sideBEqualsSumOfRemainingSides = Triangle(3, 6, 3)
        let sideAEqualsSumOfRemainingSides = Triangle(6, 3, 3)
        XCTAssertEqual(sideCEqualsSumOfRemainingSides.isTriangle(sideCEqualsSumOfRemainingSides), errorMessage)
        XCTAssertEqual(sideBEqualsSumOfRemainingSides.isTriangle(sideBEqualsSumOfRemainingSides), errorMessage)
        XCTAssertEqual(sideAEqualsSumOfRemainingSides.isTriangle(sideAEqualsSumOfRemainingSides), errorMessage)
    }
    
    func testAllZeroLengthSides() {
        let zeroLengthSidesTriangle = Triangle(0, 0, 0)
        XCTAssertEqual(zeroLengthSidesTriangle.isTriangle(zeroLengthSidesTriangle), errorMessage)
    }
    
    func testTwoZeroLengthSides() {
        let twoZeroLengthSidesCase1 = Triangle(0, 0, 1)
        let twoZeroLengthSidesCase2 = Triangle(0, 1, 0)
        let twoZeroLengthSidesCase3 = Triangle(1, 0, 0)
        let twoZeroLengthSidesCase4 = Triangle(0, 0, 100)
        XCTAssertEqual(twoZeroLengthSidesCase1.isTriangle(twoZeroLengthSidesCase1), errorMessage)
        XCTAssertEqual(twoZeroLengthSidesCase2.isTriangle(twoZeroLengthSidesCase2), errorMessage)
        XCTAssertEqual(twoZeroLengthSidesCase3.isTriangle(twoZeroLengthSidesCase3), errorMessage)
        XCTAssertEqual(twoZeroLengthSidesCase4.isTriangle(twoZeroLengthSidesCase4), errorMessage)
    }
    
    func testOneZeroLengthSide() {
        let oneZeroLengthSideCase1 = Triangle(0, 2, 3)
        let oneZeroLengthSideCase2 = Triangle(2, 0, 3)
        let oneZeroLengthSideCase3 = Triangle(2, 3, 0)
        let oneZeroLengthSideCase4 = Triangle(0, 4, 4)
        XCTAssertEqual(oneZeroLengthSideCase1.isTriangle(oneZeroLengthSideCase1), errorMessage)
        XCTAssertEqual(oneZeroLengthSideCase2.isTriangle(oneZeroLengthSideCase2), errorMessage)
        XCTAssertEqual(oneZeroLengthSideCase3.isTriangle(oneZeroLengthSideCase3), errorMessage)
        XCTAssertEqual(oneZeroLengthSideCase4.isTriangle(oneZeroLengthSideCase4), errorMessage)
    }
}
