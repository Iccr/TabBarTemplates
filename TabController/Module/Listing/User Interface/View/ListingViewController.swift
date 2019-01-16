//
//  ListingViewController.swift
//  TabController
//
//  Created by gme_2 on 16/01/2019.
//Copyright © 2019 ccr. All rights reserved.
//

import UIKit

class ListingViewController: UIViewController {
    
    // MARK: IBOutlets
    var vehicles: [Vehicle]?
    
    @IBOutlet weak var shadowView: UIView!
    
    // MARK: Properties
    
    var presenter: ListingModuleInterface?
    

    // MARK: VC's Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }
    
    // MARK: IBActions
    
    // MARK: Other Functions
    
    private func setup() {
        // all setup should be done here
        self.showNavigation()
        shadowView.layer.addShadow(with: UIColor.lightGray, offset: CGSize.init(width: 5, height: 5))
        presenter?.viewIsReady()
    }
}

// MARK: ListingViewInterface
extension ListingViewController: ListingViewInterface {
    func show(models: [Vehicle]) {
        self.vehicles = models
    }
}
