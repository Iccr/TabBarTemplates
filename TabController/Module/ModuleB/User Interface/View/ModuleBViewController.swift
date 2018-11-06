//
//  ModuleBViewController.swift
//  TabController
//
//  Created by shishir sapkota on 4/4/18.
//Copyright © 2018 ccr. All rights reserved.
//

import UIKit

class ModuleBViewController: UIViewController {
    
    // MARK: Properties
    
    var presenter: ModuleBModuleInterface?
    
    // MARK: IBOutlets
    
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

// MARK: ModuleBViewInterface
extension ModuleBViewController: ModuleBViewInterface {
    
}