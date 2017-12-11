//
//  ShoeDataNormalizer.swift
//  Repress
//
//  Created by Bram Honingh on 11-12-17.
//  Copyright © 2017 geartotten. All rights reserved.
//

import Foundation

class ShoeDataNormalizer {
    let MAX_PRESSURE_VALUE: Float = 600; // Maxiumum value the shoe will generate on average
    
    func normalizePressureValue(pressureValue: Float) -> Float {
        if pressureValue > MAX_PRESSURE_VALUE {
            // Is weird value
            return 1
        } else {
            return pressureValue / MAX_PRESSURE_VALUE
        }
    }
}
