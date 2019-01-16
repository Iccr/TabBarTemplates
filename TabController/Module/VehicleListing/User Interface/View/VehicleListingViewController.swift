//
//  VehicleListingViewController.swift
//  TabController
//
//  Created by gme_2 on 16/01/2019.
//Copyright © 2019 ccr. All rights reserved.
//

import UIKit

class VehicleListingViewController: UIViewController {
    
    // MARK: IBOutlets
    
    @IBOutlet weak var shadowView: UIView!
    
    // MARK: Properties
    
    var presenter: VehicleListingModuleInterface?
    

    // MARK: VC's Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }
    
    // MARK: IBActions
    
    // MARK: Other Functions
    
    private func setup() {
        // all setup should be done here
       shadowView.layer.addShadow(with: UIColor.black)
    }
}

// MARK: VehicleListingViewInterface
extension VehicleListingViewController: VehicleListingViewInterface {
    
}
