//
//  ConfirmationViewController.swift
//  TabController
//
//  Created by gme_2 on 17/01/2019.
//Copyright © 2019 ccr. All rights reserved.
//

import UIKit

class ConfirmationViewController: UIViewController {
    
    // MARK: IBOutlets
    
    
    // MARK: Properties
    
    var presenter: ConfirmationModuleInterface?
    var model: Hotel?
    var request: SearchRequestModel?

    // MARK: VC's Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
        presenter?.viewIsReady()
    }
    
    // MARK: IBActions
    
    // MARK: Other Functions
    
    private func setup() {
        // all setup should be done here
       
    }
}

// MARK: ConfirmationViewInterface
extension ConfirmationViewController: ConfirmationViewInterface {
    func show(model: Hotel, request: SearchRequestModel) {
        self.model = model
        self.request = request
    }
}
