//
//  AddRandomFunctionToDouble.swift
//  Repress
//
//  Created by Bram Honingh on 20-12-17.
//  Copyright © 2017 geartotten. All rights reserved.
//

import Foundation

extension Double {
    static func random(range: CountableClosedRange<Int>) {
        let MAX_RANDOM_VALUE: UInt32 = UInt32(range.upperBound)
        let MIN_RANDOM_VALUE: UInt32 = UInt32(range.lowerBound)
        
        print(drand48())
    }
}
