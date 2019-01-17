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
            self.collectionView.reloadData()
        }
    }
    
    // MARK: IBOutlets
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
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
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
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


extension DetailViewController: UICollectionViewDelegate {
    
}

extension DetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model?.images?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailImageCollectionViewCell", for: indexPath) as! DetailImageCollectionViewCell
        cell.image = self.model?.images?.elementAt(index: indexPath.row)
        cell.setup()
        return cell
    }
}
