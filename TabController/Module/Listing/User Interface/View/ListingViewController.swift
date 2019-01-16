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
    var models: [Vehicle]?
    
    @IBOutlet weak var shadowView: UIView!
    
    // MARK: Properties
    
    @IBOutlet weak var tableview: UITableView!
    
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
        self.tableview.delegate = self
        self.tableview.dataSource = self
        shadowView.layer.addShadow(with: UIColor.lightGray, offset: CGSize.init(width: 5, height: 5))
        presenter?.viewIsReady()
    }
}

// MARK: ListingViewInterface
extension ListingViewController: ListingViewInterface {
    func show(models: [Vehicle]) {
        self.models = models
    }
}


extension ListingViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
}

extension ListingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "ListingModelsTableViewCell") as! ListingModelsTableViewCell
        cell.model = self.models?.elementAt(index: indexPath.row)
        cell.setup()
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models?.count ?? 0
    }
}
