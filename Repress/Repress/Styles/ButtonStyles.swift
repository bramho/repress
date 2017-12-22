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
//        orangeButton.setBackgroundImage(imageFromColor(repressOrange), for: .normal)
        orangeButton.backgroundColor = repressOrange
        
        let whiteButton = WhiteButton.appearance()
        whiteButton.setTitleColor(repressOrange, for: .normal)
        whiteButton.borderWidth = 1
        whiteButton.borderColor = repressOrange
        
        whiteButton.setTitleColor(UIColor.gray, for: .disabled)
        
        let roundButton = RoundButton.appearance()
        roundButton.setTitleColor(UIColor.white, for: .normal)
        roundButton.borderWidth = 4
        roundButton.backgroundColor = repressOrange
        roundButton.borderColor = UIColor.white
        roundButton.cornerRadius = 30
        
//        roundButton.setTitleColor(repressBlue, for: .disabled)
//        roundButton.setBackgroundImage(imageFromColor(UIColor.gray), for: .disabled)
    }
}

class OrangeButton: UIButton {}

class WhiteButton: UIButton {}

class RoundButton: UIButton{}

// WARNING: Breaks corner radius, no fix yet
// Needs to be used to set background color for buttons with states
func imageFromColor(_ colour: UIColor) -> UIImage {
    let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
    UIGraphicsBeginImageContext(rect.size)
    let context = UIGraphicsGetCurrentContext()
    context!.setFillColor(colour.cgColor)
    context!.fill(rect)
    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return image!
}

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
