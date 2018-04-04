//
//  MainViewController.swift
//  TabController
//
//  Created by shishir sapkota on 4/4/18.
//Copyright © 2018 ccr. All rights reserved.
//


import Foundation
import UIKit

class MainViewController: UITabBarController {
    // MARK: Properties
    
    
    // MARK: ENUMS:
    private enum Items: Int {
        case home = 0
        case vehicle
        case nearby
        case profile
        case more
    }
    
    var presenter: MainModuleInterface?
    
    // MARK: VC's Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupAppearance()
    }
    
    func setup(viewControllers: [UIViewController]) {
        self.viewControllers = viewControllers
        self.setupTab()
        setupTabItem()
    }
    
    // MARK: Other functions
    func setupAppearance() {
        UINavigationBar.setInsideAppearance()
    }
    
    private func setupTab() {
        self.tabBar.barTintColor = Colors.TabBar.barTint
        self.tabBar.isTranslucent = false
        self.tabBar.shadowImage = Colors.TabBar.shadow.image()
        self.tabBar.backgroundImage = UIImage()
    }
    
    override func setupTabItem() {
        self.viewControllers?.forEach({ (viewController) in
            viewController.tabBarItem.imageInsets = UIEdgeInsets(top: 7, left: 0, bottom: -7, right: 0)
        })
    }
    
}

extension MainViewController: MainViewInterface {
    
}
