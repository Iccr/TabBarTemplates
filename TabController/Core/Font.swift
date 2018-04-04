//
//  Font.swift
//  TabController
//
//  Created by shishir sapkota on 4/4/18.
//Copyright © 2018 ccr. All rights reserved.
//

import UIKit

struct Fonts {
    
    private struct Family {
        static let regular = "Montserrat-Regular"
        static let light = "Montserrat-Light"
        static let bold = "Montserrat-Bold"
    }
    
    struct TabBar {
        static let itemFont = UIFont(name: Family.light, size: 10)!
    }
    
    struct NavBar {
        static let titleFont = UIFont(name: Family.regular, size: 17)!
    }
    
    struct XLTabBar {
        static let itemFont = UIFont(name: Family.light, size: 12)!
    }
}
