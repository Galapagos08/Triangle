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
    let errorMessage = "this triangle cannot exist"
    
    func testTriangleInitialization() {
        let potentialTriangle = Triangle(3, 3, 3)
        XCTAssertNotNil(potentialTriangle) 
    }
    
    func testEquilateral() {
        let triangle = Triangle(3, 3, 3)
        XCTAssertEqual(triangle.isTriangle(triangle), "Equilateral")
    }
    
    func testNotEquilateral() {
        let triangle = Triangle(3, 3, 5)
        XCTAssertNotEqual(triangle.isTriangle(triangle), "Equilateral")
    }
    
    func testIsosceles() {
        let triangle = Triangle(3, 3, 4)
        XCTAssertEqual(triangle.isTriangle(triangle), "Isosceles")
    }
    
    func testScalene() {
        let triangle = Triangle(3, 4, 5)
        XCTAssertEqual(triangle.isTriangle(triangle), "Scalene")
    }
    
    func testInvalidTriangle() {
        let invalidTriangle = Triangle(2, 3, 7)
        XCTAssertEqual(invalidTriangle.isTriangle(invalidTriangle), errorMessage)
    }

    func testAnotherInvalidTriangle() {
        let anotherInvalidTriangle = Triangle(3, 3, 7)
        XCTAssertEqual(anotherInvalidTriangle.isTriangle(anotherInvalidTriangle), errorMessage)
    }
    
    func testZeroLength() {
        let zeroTriangle = Triangle(0, 0, 0)
        XCTAssertEqual(zeroTriangle.isTriangle(zeroTriangle), errorMessage)
    }
    
    func testTwoZeroes() {
        let twoZeroTriangle = Triangle(0, 0, 4)
        XCTAssertEqual(twoZeroTriangle.isTriangle(twoZeroTriangle), errorMessage)
    }
    
    func testOneZero() {
        let oneZeroTriangle = Triangle(0, 4, 3)
        XCTAssertEqual(oneZeroTriangle.isTriangle(oneZeroTriangle), errorMessage)
    }
}
