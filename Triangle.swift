//
//  Triangle.swift
//  Triangle
//
//  Created by Dan Esrey on 2017/20/01.
//  Copyright © 2017 Dan Esrey. All rights reserved.
//

import Foundation

class Triangle {
    private var sideA: UInt
    private var sideB: UInt
    private var sideC: UInt
    
    init(_ sideA: UInt, _ sideB: UInt, _ sideC: UInt) {
        self.sideA = sideA
        self.sideB = sideB 
        self.sideC = sideC
    }
    
    func isTriangle(_ triangle: Triangle) -> String {
        if isEquilateral(triangle) {
            return "Equilateral"
        } else if isIsosceles(triangle) {
            return "Isosceles"
        } else if  isScalene(triangle){
            return "Scalene"
        } else {
            return "this triangle cannot exist"
        }
    }
    
    private func isEquilateral(_ triangle: Triangle) -> Bool {
        return sideAEqualsSideB(triangle) &&
            sideAEqualsSideC(triangle) &&
            validTriangle(triangle)
    }
    
    private func isIsosceles(_ triangle: Triangle) -> Bool {
        return sideAEqualsSideB(triangle) &&
            !sideAEqualsSideC(triangle) &&
            validTriangle(triangle)
    }
    
    private func isScalene(_ triangle: Triangle) -> Bool {
        return !sideAEqualsSideB(triangle) &&
            !sideAEqualsSideC(triangle) &&
            triangle.sideB != triangle.sideC &&
            validTriangle(triangle)
    }
    
    private func sideAEqualsSideB(_ triangle: Triangle) -> Bool {
        return triangle.sideA == triangle.sideB
    }
    
    private func sideAEqualsSideC(_ triangle: Triangle) -> Bool {
        return triangle.sideA == triangle.sideC
    }
    
    private func validTriangle(_ triangle: Triangle) -> Bool {
        return sideC <= sideA + sideB &&
            sideA != 0 &&
            sideB != 0 &&
            sideC != 0
    }
}
