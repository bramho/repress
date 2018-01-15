//
//  IntExtensions.swift
//  Repress
//
//  Created by Bram Honingh on 20-12-17.
//  Copyright © 2017 geartotten. All rights reserved.
//

import Foundation

extension Int {
    static func random(range: CountableClosedRange<Int>) -> Int {
        let MAX_RANDOM_VALUE: UInt32 = UInt32(range.upperBound)
        let MIN_RANDOM_VALUE: UInt32 = UInt32(range.lowerBound)
        
        return Int(arc4random_uniform(MAX_RANDOM_VALUE - MIN_RANDOM_VALUE) + MIN_RANDOM_VALUE)
    }
    
    static func isNumber(_ value: Any) -> Bool {
        let num = value as? Int
        print(num)
        return num != nil
    }
    
    static func percentage(value1: Any, value2: Any) -> [Int]? {
        /**
         Calculates the percentage of two values. The value can be of any Number type (read: Int, Double, Float etc.)
         
         Returns an array with two values, the first entry representing the percentage of value1 and the second entry representing the percentage of value2
         
         *Values*
         
         `value1` First value to be percentaged. This is the value that the percentage will be based upon.
         
         `value2` Second value to be percentaged. This is used to build up the total to percentify.
         */
        if(!Int.isNumber(value1) || !Int.isNumber(value2)){
            print("VALUE IS NIL")
            return nil
        }
        
        let a = value1 as! Double
        let b = value2 as! Double
        let c = a + b
        
        let percentage = [Int(100 * (c / a)), Int(100 * (c / b))]
        
        return percentage
    }
}
