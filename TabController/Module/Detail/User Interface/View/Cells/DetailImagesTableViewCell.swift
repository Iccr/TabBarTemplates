//
//  DetailImagesTableViewCell.swift
//  TabController
//
//  Created by gme_2 on 17/01/2019.
//  Copyright © 2019 ccr. All rights reserved.
//

import UIKit

class DetailImagesTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    var model: Hotel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setup() {
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }
}


extension DetailImagesTableViewCell: UICollectionViewDelegate {}

extension DetailImagesTableViewCell: UICollectionViewDataSource {
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
