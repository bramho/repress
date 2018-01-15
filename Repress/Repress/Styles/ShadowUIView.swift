//
//  ShadowUIView.swift
//  Repress
//
//  Created by Geart on 09/01/2018.
//  Copyright © 2018 geartotten. All rights reserved.
//

import Foundation
import UIKit

class ShadowUIView{
    static func applyShadows(){
        let shadowView = ShadowView.appearance()
        shadowView.layer.shadowColor = UIColor.black.cgColor
        shadowView.layer.shadowOffset = CGSize(width: 20,height: 20)
        shadowView.layer.shadowRadius = 4.0;
        shadowView.layer.shadowOpacity = 0.8;
        shadowView.layer.shadowPath = UIBezierPath(rect: shadowView.bounds).cgPath
        shadowView.layer.shouldRasterize = true
    }

}
class ShadowView: UIView{}
