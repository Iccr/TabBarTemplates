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
    
}

extension DetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let index = DetailCells.init(rawValue: indexPath.row) else {return UITableViewCell()}
        
        switch index {
        case .images:
            break
        case .info: break
        case .location: break
        case .rating: break
        case .amenities: break
        }
        
        return UITableViewCell()
    }
    
    private func configureImagesCell(tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell  {
        
    }
}
