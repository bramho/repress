//
//  LabelStyles.swift
//  Repress
//
//  Created by Bram Honingh on 19-12-17.
//  Copyright © 2017 geartotten. All rights reserved.
//

import Foundation
import UIKit

class LabelStyles {
    static func applyLabelStyles() {
        let smallBlueLabel = SmallBlueLabel.appearance()
        smallBlueLabel.textColor = repressBlue
        smallBlueLabel.font = UIFont(name: "AvenirNext-DemiBold", size: 14.0)
        smallBlueLabel.textAlignment = .center
        
        let largeBlueLabel = LargeBlueLabel.appearance()
        largeBlueLabel.textColor = repressBlue
        largeBlueLabel.font = UIFont(name: "AvenirNext-DemiBold", size: 32.0)
        largeBlueLabel.textAlignment = .right
        
        let orangeLabel = OrangeLabel.appearance()
        orangeLabel.textColor = repressOrange
        orangeLabel.font = UIFont(name: "AvenirNext-DemiBold", size: 16.0)
        orangeLabel.textAlignment = .left
    }
}

class SmallBlueLabel: UILabel {}
class LargeBlueLabel: UILabel {}
class OrangeLabel: UILabel {}
