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
        button.cornerRadius = 12
        button.titleLabel?.numberOfLines = 1
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        
        let orangeButton = OrangeButton.appearance()
        orangeButton.setTitleColor(UIColor.white, for: .normal)
        orangeButton.backgroundColor = repressOrange
        
        let whiteButton = WhiteButton.appearance()
        whiteButton.setTitleColor(repressOrange, for: .normal)
        whiteButton.borderWidth = 1
        whiteButton.borderColor = repressOrange
    }
}

class OrangeButton: UIButton {}

class WhiteButton: UIButton {}


extension UIButton {
    @objc dynamic override var cornerRadius: CGFloat {
        get { return layer.cornerRadius }
        set { layer.cornerRadius = newValue }
    }
    
    @objc dynamic var borderColor: UIColor? {
        get {
            if let cgColor = layer.borderColor {
                return UIColor(cgColor: cgColor)
            }
            return nil
        }
        set { layer.borderColor = newValue?.cgColor }
    }
    
    @objc dynamic var borderWidth: CGFloat {
        get { return layer.borderWidth }
        set { layer.borderWidth = newValue }
    }
    
    @objc dynamic var titleLabelFont: UIFont! {
        get { return self.titleLabel?.font }
        set { self.titleLabel?.font = newValue }
    }
}
