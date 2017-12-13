//
//  RoundButtonView.swift
//  Repress
//
//  Created by Geart on 13/12/2017.
//  Copyright © 2017 geartotten. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class RoundImageView: UIImageView {
    @IBInspectable var cornerRadius: CGFloat = 0{
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
}
