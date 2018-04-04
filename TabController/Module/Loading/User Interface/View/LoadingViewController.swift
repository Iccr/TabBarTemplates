//
//  LoadingViewController.swift
//  TabController
//
//  Created by shishir sapkota on 4/4/18.
//Copyright © 2018 ccr. All rights reserved.
//

import UIKit

class LoadingViewController: UIViewController {
    
    // MARK: Properties
    
    var presenter: LoadingModuleInterface?
    
    // MARK: IBOutlets
    
    // MARK: VC's Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
        print("loading did load.")
        presenter?.viewIsReady()
    }
    
    // MARK: IBActions
    
    // MARK: Other Functions
    
    private func setup() {
        // all setup should be done here
    }
}

// MARK: LoadingViewInterface
extension LoadingViewController: LoadingViewInterface {
    
}
