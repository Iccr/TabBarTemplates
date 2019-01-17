//
//  DetailViewController.swift
//  TabController
//
//  Created by shishir sapkota on 1/16/19.
//Copyright © 2019 ccr. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    // MARK: Properties
    
    var presenter: DetailModuleInterface?
    
    var model: Hotel? {
        didSet {
            
        }
    }
    
    // MARK: IBOutlets
    
    // MARK: VC's Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = ""
    }
    
    // MARK: IBActions
    
    // MARK: Other Functions
    
    private func setup() {
        // all setup should be done here
    }
}

// MARK: DetailViewInterface
extension DetailViewController: DetailViewInterface {
    func show(model: Hotel) {
        self.model = model
    }
    
    func show(error: String) {
        self.alert(message: error)
    }
}
