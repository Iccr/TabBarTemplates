//
//  UIViewExtension.swift
//  TabController
//
//  Created by shishir sapkota on 4/4/18.
//Copyright © 2018 ccr. All rights reserved.
//


import UIKit

extension UIView {
    func set(cornerRadius radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
    
    func set(border: UIColor) {
        self.layer.borderColor = border.cgColor;
    }
    
    func set(borderWidth: CGFloat) {
        self.layer.borderWidth = borderWidth
    }
    
    func set(borderWidth width: CGFloat, of color: UIColor) {
        self.set(border: color)
        self.set(borderWidth: width)
    }
    
    func rounded() {
        self.set(cornerRadius: self.frame.height/2)
    }
    
    func show(value: Bool) {
        self.isHidden = !value
    }
    
}
