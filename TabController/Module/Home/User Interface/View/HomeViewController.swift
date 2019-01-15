//
//  HomeViewController.swift
//  TabController
//
//  Created by gme_2 on 15/01/2019.
//Copyright © 2019 ccr. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: IBOutlets
    
    
    // MARK: Properties
    
    var presenter: HomeModuleInterface?
    

    // MARK: VC's Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }
    
    // MARK: IBActions
    
    // MARK: Other Functions
    
    private func setup() {
        // all setup should be done here
       
    }
    
    override func setupTabItem() {
        self.tabBarItem = UITabBarItem(title: "Home", image: #imageLiteral(resourceName: "home"), selectedImage: #imageLiteral(resourceName: "home_ac"))
        self.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: UI_USER_INTERFACE_IDIOM() == .pad ? 2 : -6)
    }
}

// MARK: HomeViewInterface
extension HomeViewController: HomeViewInterface {
    
}
