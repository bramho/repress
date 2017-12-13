//
//  ButtonStyles.swift
//  Repress
//
//  Created by Bram Honingh on 12-12-17.
//  Copyright © 2017 geartotten. All rights reserved.
//

import UIKit

class ButtonStyles {
    static func applyButtonStyles() {
        let orangeButton = OrangeButton.appearance()
        orangeButton.setTitleColor(UIColor.white, for: .normal)
        orangeButton.backgroundColor = UIColor.orange
        
        let whiteButton = WhiteButton.appearance()
        whiteButton.setTitleColor(UIColor.orange, for: .normal)
        whiteButton.backgroundColor = UIColor.white
    }
}

class OrangeButton: UIButton {}

class WhiteButton: UIButton {}
