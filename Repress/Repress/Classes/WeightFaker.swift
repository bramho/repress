//
//  WeightFaker.swift
//  Repress
//
//  Created by Bram Honingh on 20-12-17.
//  Copyright © 2017 geartotten. All rights reserved.
//

import Foundation

class WeightFaker {
    let minWeight: Double
    let maxWeight: Double
    
    init(minWeight: Double = 50, maxWeight: Double = 110) {
        self.minWeight = minWeight
        self.maxWeight = maxWeight
    }
    
    func checkForMinimalWeight(weight: Double) -> Double {
        if (weight > minWeight) {
            return weight
        } else {
            return weight + minWeight
        }
    }
    
    func getRightShoeWeight(totalWeight: Double, leftShoeWeight: Double) -> Double {
        return totalWeight - leftShoeWeight
    }
    
    func devideWeight(weight: Double) -> Double {
        let randomDistribution = Double(Int.random(range: 40...60))
        let calculatedWeight = weight * (randomDistribution /  100)
        
        return (round(calculatedWeight * 100) / 100)
    }
    
    func getRandomWeight() -> Double {
        let randomWeight = drand48() * maxWeight
        
        return (round(checkForMinimalWeight(weight: randomWeight) * 10) / 10)
    }
    
}
