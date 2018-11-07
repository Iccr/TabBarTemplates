//
//  AddItemsViewController.swift
//  TabController
//
//  Created by gme_2 on 07/11/2018.
//Copyright © 2018 ccr. All rights reserved.
//

import UIKit

class AddItemsViewController: UITableViewController {
    
    // MARK: IBOutlets
    var items: SearchItem = SearchItem(category: "Accessories")
    
    
    @IBOutlet weak var categoryTextField: UITextField!
    @IBOutlet weak var sizeTextfield: UITextField!
    @IBOutlet weak var colorTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var numberOfTabsTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var cardTextField: UITextField!
    
    
    // MARK: Properties
    
    var presenter: AddItemsModuleInterface?
    

    // MARK: VC's Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }
    
    
    public func getItem() -> SearchItem? {
        let item = SearchItem(category: "Accessories")
        item.cateogry = categoryTextField.text!
        item.size = sizeTextfield.text!
        item.color = colorTextField.text!
        item.name = nameTextField.text!
        item.numberOfTabls = numberOfTabsTextField.text!
        item.address = addressTextField.text!
        item.card = cardTextField.text!
        return item
    }
    
    
    @IBAction func done(_ sender: UIButton) {
        let item = self.getItem()
        
        
    }
    
    // MARK: Other Functions
    
    private func setup() {
        
       self.tableView.delegate = self
        self.tableView.dataSource = self
    }
}

// MARK: AddItemsViewInterface
extension AddItemsViewController: AddItemsViewInterface {
    
}


extension AddItemsViewController: RealmPersistenceType {
    
}
