//
//  TabbarStyle.swift
//  Repress
//
//  Created by Bram Honingh on 19-12-17.
//  Copyright © 2017 geartotten. All rights reserved.
//

import Foundation
import UIKit


class TabbarItemStyles {
    static func applyTabbarItemStyles() {
        let tabbar = UITabBarItem.appearance()
        tabbar.setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor.black], for: .normal)
        tabbar.setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor.white], for: .selected)
    }
}

class TabbarItem: UITabBarItem {}
