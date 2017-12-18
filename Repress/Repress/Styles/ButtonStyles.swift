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
        let button = UIButton.appearance()
        button.titleLabelFont = UIFont(name: "AvenirNext-DemiBold", size: 18.0)
        
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


extension UIButton {
    @objc dynamic var cornerRadius: CGFloat {
        get { return layer.cornerRadius }
        set { layer.cornerRadius = newValue }
    }
    
    @objc dynamic var titleLabelFont: UIFont! {
        get { return self.titleLabel?.font }
        set { self.titleLabel?.font = newValue }
    }
}
