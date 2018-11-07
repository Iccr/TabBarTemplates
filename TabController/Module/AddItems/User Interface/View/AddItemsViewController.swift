//
//  AddItemsViewController.swift
//  TabController
//
//  Created by gme_2 on 07/11/2018.
//Copyright © 2018 ccr. All rights reserved.
//

import UIKit

class AddItemsViewController: UIViewController {
    
    // MARK: IBOutlets
    
    
    // MARK: Properties
    
    var presenter: AddItemsModuleInterface?
    

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
}

// MARK: AddItemsViewInterface
extension AddItemsViewController: AddItemsViewInterface {
    
}
