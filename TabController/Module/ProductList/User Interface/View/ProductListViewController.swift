//
//  ProductListViewController.swift
//  TabController
//
//  Created by gme_2 on 07/11/2018.
//Copyright © 2018 ccr. All rights reserved.
//

import UIKit

class ProductListViewController: UIViewController {
    
    // MARK: IBOutlets
    var items: [SearchItem] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    
    // MARK: Properties
    
    var presenter: ProductListModuleInterface?
    

    // MARK: VC's Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }
    
    // MARK: IBActions
    @IBAction func addItems(_ sender: UIButton) {
        let addWireframe = AddItemsWireframe()
        if let navigation = self.navigationController {
            addWireframe.pushMainView(in: navigation)
        }
    }
    
    @IBAction func done(_ sender: UIButton) {

    }
    // MARK: Other Functions
    
    private func setup() {
        // all setup should be done here
        self.tableView.delegate = self
        self.tableView.dataSource = self
       
    }
}

// MARK: ProductListViewInterface
extension ProductListViewController: ProductListViewInterface {
    
}


extension ProductListViewController: UITableViewDelegate {
    
}

extension ProductListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemsTableViewCell") as! ItemsTableViewCell
        cell.item = self.items.elementAt(index: indexPath.row)
        cell.setup()
        return cell
    }
}
