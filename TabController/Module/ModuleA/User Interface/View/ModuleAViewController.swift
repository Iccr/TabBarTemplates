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
    
    var itemList: AllItemsList?
    // MARK: VC's Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
        self.setupTabItem()
        startSearching()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setup()
    }
    
    
    func startSearching() {
        
        var category = "Jacketd"
        var color = "Dark Rose"
        var name = "2-Tone Zip Up Jacket"
        var size = "Small"
        var tabsNo = 2
        
        
    }
    
    // MARK: IBActions
    
    // MARK: Other Functions
    
    private func setup() {
        // all setup should be done here
        self.fetchAllItems(url: self.url, success: { (items) in
            self.itemList = items
        }) { (error) in
            self.alert(message: error.localizedDescription)
        }
    }
    
    override func setupTabItem() {
        self.tabBarItem = UITabBarItem(title: "Home", image: #imageLiteral(resourceName: "home"), selectedImage: #imageLiteral(resourceName: "home_ac"))
        self.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: UI_USER_INTERFACE_IDIOM() == .pad ? 2 : -6)
    }
}

// MARK: ModuleAViewInterface
extension ModuleAViewController: ModuleAViewInterface {
    
}

extension ModuleAViewController: FetchAllItems {
    
}


protocol FetchAllItems: ApiServiceType {
    func fetchAllItems(url: String, success: @escaping (AllItemsList) -> (), failure: @escaping (Error) -> ())
}


extension FetchAllItems {
    func fetchAllItems(url: String, success: @escaping (AllItemsList) -> (), failure: @escaping (Error) -> ()) {
        auth.request(method: .get, url: url, params: nil, success: { (response: AllItemsList) in
            let data = response
            success(data)
        }) { (error) in
            failure(error)
        }
    }
}
