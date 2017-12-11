//
//  LiftFoot.swift
//  Repress
//
//  Created by Bram Honingh on 11-12-17.
//  Copyright © 2017 geartotten. All rights reserved.
//

import Foundation


class LiftFoot {
    var highestValue: Int
    var lowestValue: Int
    var isLowestValue: Bool
    var isHighestValue: Bool
    var completedLifting: Bool
    var isLifting: Bool
    
    init() {
        highestValue = 550
        lowestValue = 540
        isLowestValue = false
        isHighestValue = false
        completedLifting = false
        isLifting = false
    }
    
    func liftFoot () {
        if (!isLowestValue) {
            liftFootUp()
        } else {
            setFootDown()
        }
    }
    
    func setFootDown () {
        highestValue += Int.random(range: 20...25)
        lowestValue += Int.random(range: 20...25)
        
        if (lowestValue > highestValue) {
            swapValues()
        }
        
        if (highestValue > 550) {
            completedLifting = true
            isLifting = false
        }
        
    }
    
    func liftFootUp () {
        highestValue -= Int.random(range: 20...25)
        lowestValue -= Int.random(range: 20...25)
        
        if (lowestValue > highestValue) {
            swapValues()
        }
        
        if (lowestValue < 50) {
            isLowestValue = true
        }
    }
    
    func resetFoot () {
        isLowestValue = false
        isHighestValue = false
        completedLifting = false
    }
    
    func swapValues () {
        let temp = highestValue
        highestValue = lowestValue
        lowestValue = temp
    }
}
