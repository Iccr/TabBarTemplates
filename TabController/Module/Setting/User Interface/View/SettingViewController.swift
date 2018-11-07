//
//  SettingViewController.swift
//  TabController
//
//  Created by gme_2 on 07/11/2018.
//Copyright © 2018 ccr. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {
    
    // MARK: IBOutlets
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var editAddressButton: UIButton!
    @IBOutlet weak var editCreditCardButton: UIButton!
    @IBOutlet weak var editItemButton: UIButton!
    
    // MARK: Properties
    
    var presenter: SettingModuleInterface?
    

    // MARK: VC's Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }
    
    // MARK: IBActions
    
    // MARK: Other Functions
    
    private func setup() {
        // all setup should be done here
        self.editItemButton.addTarget(self, action: #selector(self.openProductList), for: UIControlEvents.touchUpInside)
    }
    
    @objc private func  openProductList() {
        let wireframe = ProductListWireframe()
        if let navigation = self.navigationController {
            wireframe.pushMainView(in: navigation)
        }
    }
}

// MARK: SettingViewInterface
extension SettingViewController: SettingViewInterface {
    
}
