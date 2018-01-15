//
//  RoundButtonView.swift
//  Repress
//
//  Created by Geart on 13/12/2017.
//  Copyright © 2017 geartotten. All rights reserved.
//

import Foundation
import UIKit

class UIViewStyles{
    static func applyUIViewStyles() {
        print("test")
        let orangeRoundUIView = OrangeRoundUIView.appearance()
        
        orangeRoundUIView.backgroundColor = repressOrange
        orangeRoundUIView.borderColor = UIColor.white
        
        let whiteRoundUIView = WhiteRoundUIView.appearance()
        
        whiteRoundUIView.backgroundColor = UIColor.white
        whiteRoundUIView.borderWidth = 1
        whiteRoundUIView.borderColor = repressOrange
        

    }
}

class OrangeRoundUIView: UIView{}

class WhiteRoundUIView: UIView {}

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
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
}

