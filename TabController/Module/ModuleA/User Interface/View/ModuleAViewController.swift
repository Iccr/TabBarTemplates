//
//  ModuleAViewController.swift
//  TabController
//
//  Created by shishir sapkota on 4/4/18.
//Copyright © 2018 ccr. All rights reserved.
//

import UIKit

class ModuleAViewController: UIViewController {
    
    // MARK: Properties
    
    var presenter: ModuleAModuleInterface?
    
    // MARK: IBOutlets
    var url = "https://www.supremenewyork.com/shop.json"
    
    // MARK: VC's Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
        self.setupTabItem()
        startSearching()
    }
    
    
    func startSearching() {
        var categories = ""
        var size = ""
        var color = ""
        var name = ""
        var numberOfTabs = ""
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

// MARK: ModuleAViewInterface
extension ModuleAViewController: ModuleAViewInterface {
    
}


