//
//  UINavigationBarExtension.swift
//  B2BOrdering
//
//  Created by Dari on 11/7/17.
//  Copyright © 2017 Ekbana. All rights reserved.
//

import UIKit

extension UINavigationBar {
    static func setInsideAppearance() {
        let navBarAppearance = UINavigationBar.appearance()
        navBarAppearance.isTranslucent = false
        navBarAppearance.barTintColor = Colors.NavBar.barTint
        navBarAppearance.setBackgroundImage(UIImage(), for: .default)
        navBarAppearance.shadowImage = UIImage() //Colors.NavBar.shadow.image()
        
        let font = Fonts.NavBar.titleFont
        
        navBarAppearance.titleTextAttributes = [
            NSAttributedStringKey.foregroundColor: Colors.NavBar.tint,
            NSAttributedStringKey.font: font]
        navBarAppearance.tintColor = Colors.NavBar.tint
    }
    
    static func setOutsideAppearance() {
        self.setInsideAppearance()
        let navBarAppearance = UINavigationBar.appearance()
        navBarAppearance.barTintColor = UIColor.white
        let font = Fonts.NavBar.titleFont
        navBarAppearance.titleTextAttributes = [
            NSAttributedStringKey.foregroundColor: UIColor.black,
            NSAttributedStringKey.font: font]
        navBarAppearance.tintColor = UIColor.black
    }
}
