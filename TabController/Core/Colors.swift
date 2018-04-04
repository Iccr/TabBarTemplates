//
//  Colors.swift
//  Sipradi
//
//  Created by shishir sapkota on 5/26/17.
//  Copyright © 2017 Ekbana. All rights reserved.
//

import UIKit

struct Colors {
    
    static let separator = UIColor(hex: "#eeeeee")
    static let defaultRed = UIColor(hex: "#E65348")
    struct TabBar {
        static let textItemSelected = Colors.defaultRed
        static let textItemNotSelected = UIColor(hex: "#717171")
        static let shadow = Colors.separator
        static let barTint = UIColor.white
    }
    
    struct NavBar {
        static let barTint = UIColor.white
        static let tint = UIColor(hex: "#535353")
        static let shadow = Colors.separator
    }
    
    struct XLTabBar {
        static let titleUnselected = UIColor(hex: "#555555")
        static let titleSelected = Colors.defaultRed
        static let selectedBackground = Colors.defaultRed
    }
    
    
}
