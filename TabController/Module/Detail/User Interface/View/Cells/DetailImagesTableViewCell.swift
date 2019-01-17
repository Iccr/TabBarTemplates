//
//  DetailImagesTableViewCell.swift
//  TabController
//
//  Created by gme_2 on 17/01/2019.
//  Copyright © 2019 ccr. All rights reserved.
//

import UIKit
import ImageSlideshow

class DetailImagesTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    var model: Hotel?
    let slideShow = ImageSlideshow()
    var parent: UIViewController?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setup() {
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        setupImageSlidShow()
    }
    
    private func setupImageSlidShow() {
        if let images = self.model?.images {
            let inputs: [AlamofireSource] = images.compactMap({ _ in
                let source = AlamofireSource.init(urlString: "https://images.unsplash.com/photo-1432679963831-2dab49187847?w=1080")
                return source
            })
            self.slideShow.setImageInputs(inputs)
//            slideShow.activityIndicator = DefaultActivityIndicator()
        }
    }
}


extension DetailImagesTableViewCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let vc = self.parent {
            slideShow.presentFullScreenController(from: vc)
        }
    }
}

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
