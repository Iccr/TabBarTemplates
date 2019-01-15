//
//  HomeViewController.swift
//  TabController
//
//  Created by gme_2 on 15/01/2019.
//Copyright © 2019 ccr. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    enum Cells: Int {
        case image = 0
        case search = 1
        case sponsored = 2
    }
    
    // MARK: IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var travelmageView: UIImageView!
    
    
    
    // MARK: Properties
    
    var rows: [Cells] = [.image, .search, .sponsored]
    var presenter: HomeModuleInterface?
    
    
    // MARK: VC's Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }
    
    // MARK: IBActions
    
    // MARK: Other Functions
    
    private func setup() {
        // all setup should be done here
        self.tableView.delegate = self
        self.tableView.dataSource  = self
    }
    
    override func setupTabItem() {
        self.tabBarItem = UITabBarItem(title: "Home", image: #imageLiteral(resourceName: "home"), selectedImage: #imageLiteral(resourceName: "home_ac"))
        self.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: UI_USER_INTERFACE_IDIOM() == .pad ? 2 : -6)
    }
}

// MARK: HomeViewInterface
extension HomeViewController: HomeViewInterface {
    
}


extension HomeViewController: UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let index = Cells.init(rawValue: indexPath.row) else {return 0}
        switch index {
        case .image:
            return self.travelmageView.bounds.height - 40
        default:
            return UITableViewAutomaticDimension
        }
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let index = Cells.init(rawValue: indexPath.row) else {return UITableViewCell()}
        
        switch index {
        case .image:
            return  configureTravelImageCell(tableView: tableView, cellForRowAt: indexPath)
        case .search:
            return configureSearchCell(tableView: tableView, cellForRowAt: indexPath)
        case .sponsored:
            return configureSponsoredCell(tableView: tableView, cellForRowAt: indexPath)
        }
    }
    
    private func configureSearchCell(tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeSearchTableViewCell") as! HomeSearchTableViewCell
        cell.setup()
        return cell
    }
    
    private func configureTravelImageCell(tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTravelTableViewCell") as! HomeTravelTableViewCell
        return cell
    }
    
    private func configureSponsoredCell(tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeSponsoredTableViewCell") as! HomeSponsoredTableViewCell
        cell.setup()
        return cell
    }
    
}

