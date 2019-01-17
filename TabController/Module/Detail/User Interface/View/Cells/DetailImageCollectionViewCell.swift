//
//  DetailImageCollectionViewCell.swift
//  TabController
//
//  Created by gme_2 on 17/01/2019.
//  Copyright © 2019 ccr. All rights reserved.
//

import UIKit

class DetailImageCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    var image: String?
    
    func setup() {
        self.backgroundColor = AppConstants.themeBlueColor
    }
}
