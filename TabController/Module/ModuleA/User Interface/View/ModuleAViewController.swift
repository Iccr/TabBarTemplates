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
    var url = "https://www.supremenewyork.com/shop"
    
    var itemDick: [String: Any]? {
        didSet {
            self.getCategoryId()
        }
    }
    // MARK: VC's Life cycle
    
    var category = "Jackets"
    var color = "Dark Rose"
    var name = "2-Tone Zip Up Jacket"
    var size = "Small"
    var tabsNo = 2
    
    
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
    
    
    func getCategoryId() {
        if let selectedCategoryItems = itemDick?[category] as? [[String: Any]] {
            selectedCategoryItems.filter {
                $0["name"] as! String == self.name
            }
            print(selectedCategoryItems)
            print("")
        }
        
//        print(selectedCategoryItems)
        print("")
    }
    
    func startSearching() {
        self.fetchAllItemsDict(url: self.url, success: { (dict) in
            self.itemDick = dict.dict
        
        }) { (error) in
            self.alert(message: error.localizedDescription)
        }
    }
    
    // MARK: IBActions
    
    // MARK: Other Functions
    
    private func setup() {
        
    }
    
    override func setupTabItem() {
        self.tabBarItem = UITabBarItem(title: "Home", image: #imageLiteral(resourceName: "home"), selectedImage: #imageLiteral(resourceName: "home_ac"))
        self.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: UI_USER_INTERFACE_IDIOM() == .pad ? 2 : -6)
    }
}

// MARK: ModuleAViewInterface
extension ModuleAViewController: ModuleAViewInterface {
    
}

extension ModuleAViewController: FetchAllItemsDict {
    
}


protocol FetchAllItems: ApiServiceType {
    func fetchAllItems(url: String, success: @escaping (AllItemsList) -> (), failure: @escaping (Error) -> ())
}


extension FetchAllItems {
    func fetchAllItems(url: String, success: @escaping (AllItemsList) -> (), failure: @escaping (Error) -> ()) {
        let url = url + ".json"
        auth.request(method: .get, url: url, params: nil, success: { (response: AllItemsList) in
            let data = response
            success(data)
        }) { (error) in
            failure(error)
        }
    }
}

protocol FetchAllItemsDict: ApiServiceType {
    func fetchAllItemsDict(url: String, success: @escaping (MappableDict) -> (), failure: @escaping (Error) -> ())
}


extension FetchAllItemsDict {
    func fetchAllItemsDict(url: String, success: @escaping (MappableDict) -> (), failure: @escaping (Error) -> ()) {
        let url = url + ".json"
        auth.request(method: .get, url: url, params: nil, success: { (response: MappableDict) in
            let data = response
            success(data)
        }) { (error) in
            failure(error)
        }
    }
}


protocol FetchItemSize: ApiServiceType {
    func fetchItemSize(url: String,  id: String, success: @escaping ([Style]) -> (), failure: @escaping (Error) -> ())
}


extension FetchItemSize {
    func fetchItemSize(url: String,  id: String, success: @escaping ([Style]) -> (), failure: @escaping (Error) -> ()) {
        let url = url + "/\(id)" + ".json"
        auth.request(method: .get, url: url, params: nil, success: { (response: StyleContainer) in
            let data = response.data
            success(data)
        }) { (error) in
            failure(error)
        }
    }
}
