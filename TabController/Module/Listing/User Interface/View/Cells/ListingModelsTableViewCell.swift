//
//  ListingModelsTableViewCell.swift
//  TabController
//
//  Created by gme_2 on 16/01/2019.
//  Copyright © 2019 ccr. All rights reserved.
//

import UIKit

class ListingModelsTableViewCell: UITableViewCell {

    @IBOutlet weak var shadowView: UIView!
    var model: Hotel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setup() {
        shadowView.layer.borderColor = AppConstants.textfieldShadowColor.cgColor
        shadowView.layer.borderWidth = 1
        shadowView.layer.addShadow(offset: CGSize(width: 2, height: 5))
    }
}
