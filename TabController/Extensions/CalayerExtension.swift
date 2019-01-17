//
//  CalayerExtension.swift
//  TabController
//
//  Created by gme_2 on 15/01/2019.
//  Copyright © 2019 ccr. All rights reserved.
//

import Foundation
import UIKit

extension CALayer {
    func addShadow(with color: UIColor, shadowRadius:CGFloat = 2, shadowOpacity: Float = 0.37, offset: CGSize = .zero ) {
        self.shadowOffset = offset
        self.shadowOpacity = shadowOpacity
        self.shadowRadius = shadowRadius
        self.shadowColor = color.cgColor
        self.masksToBounds = false
    }
    
    func addShadow(offset: CGSize, color: UIColor = .black) {
        self.addShadow(with: color, shadowRadius: 2, shadowOpacity: 0.20, offset: offset)
    }
}
