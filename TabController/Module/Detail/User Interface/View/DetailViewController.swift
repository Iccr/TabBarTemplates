//
//  DetailViewController.swift
//  TabController
//
//  Created by shishir sapkota on 1/16/19.
//Copyright © 2019 ccr. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    enum DetailCells: Int {
        case images = 0
        case info
        case location
        case rating
        case amenities
    }
    
    // MARK: Properties
    
    var presenter: DetailModuleInterface?
    
    var cells: [DetailCells]  = [.images, .info, .location, .rating, .amenities]
    
    var model: Hotel? {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    // MARK: IBOutlets
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var bookNowBackgroundView: UIView!
    
    
    // MARK: VC's Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
        self.presenter?.viewIsReady()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = ""
    }
    
    // MARK: IBActions
    
    // MARK: Other Functions
    
    private func setup() {
        // all setup should be done here
        self.tableView.delegate = self
        self.tableView.dataSource = self
        let color = UIColor.init(hex: "#0000B8")
        self.bookNowBackgroundView.layer.addShadow(with: color, shadowRadius: 8)
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


extension DetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension DetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let index = DetailCells.init(rawValue: indexPath.row) else {return UITableViewCell()}
        
        switch index {
        case .images:
            return configureImagesCell(tableView: tableView, cellForRowAt: indexPath)
        case .info:
            return configureInfoCell(tableView: tableView, cellForRowAt: indexPath)
        case .location:
            return configureLocationCell(tableView: tableView, cellForRowAt: indexPath)
        case .rating:
            return configureRatingCell(tableView: tableView, cellForRowAt: indexPath)
        case .amenities:
            return configureAmenitiesCell(tableView: tableView, cellForRowAt: indexPath)
        }
    }
    
    private func configureImagesCell(tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell  {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailImagesTableViewCell") as! DetailImagesTableViewCell
        cell.model = self.model
        cell.setup()
        return cell
    }
    
    private func configureInfoCell(tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell  {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailInfoTableViewCell") as! DetailInfoTableViewCell
        cell.model = self.model
        cell.setup()
        return cell
    }
    
    private func configureLocationCell(tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell  {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailLocationTableViewCell") as! DetailLocationTableViewCell
        cell.model = self.model
        cell.setup()
        return cell
    }
    
    private func configureRatingCell(tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell  {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailRatingTableViewCell") as! DetailRatingTableViewCell
        cell.model = self.model
        cell.setup()
        return cell
    }
    
    private func configureAmenitiesCell(tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell  {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailAmenitiesTableViewCell") as! DetailAmenitiesTableViewCell
        cell.model = self.model
        cell.setup()
        return cell
    }
}
