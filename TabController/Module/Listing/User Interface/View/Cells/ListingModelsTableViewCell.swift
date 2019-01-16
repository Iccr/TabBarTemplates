//
//  ListingModelsTableViewCell.swift
//  TabController
//
//  Created by gme_2 on 16/01/2019.
//  Copyright © 2019 ccr. All rights reserved.
//

import UIKit

class ListingModelsTableViewCell: UITableViewCell {

    @IBOutlet weak var header1Label: UILabel!
    @IBOutlet weak var header2Label: UILabel!
    @IBOutlet weak var logoImageview: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var departureTImeLabel: UILabel!
    @IBOutlet weak var arrivalTimeLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var departurePlaceLabel: UILabel!
    @IBOutlet weak var arrivalPlaceLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var remainingSeatLabel: UILabel!
    @IBOutlet weak var pricelabel: UILabel!
    @IBOutlet weak var imageview1: UIImageView!
    @IBOutlet weak var imageview2: UIImageView!
    @IBOutlet weak var imageview3: UIImageView!
    @IBOutlet weak var imageview4: UIImageView!
    @IBOutlet weak var imageview5: UIImageView!
    @IBOutlet weak var imageview6: UIImageView!
    @IBOutlet weak var title1Label: UILabel!
    @IBOutlet weak var title2Label: UILabel!
    @IBOutlet weak var title3Label: UILabel!
    @IBOutlet weak var title4Label: UILabel!
    @IBOutlet weak var title5Label: UILabel!
    @IBOutlet weak var title6Label: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var starButton1: UIButton!
    @IBOutlet weak var starButton2: UIButton!
    @IBOutlet weak var starButton3: UIButton!
    @IBOutlet weak var starButton4: UIButton!
    @IBOutlet weak var starButton5: UIButton!
    @IBOutlet weak var totalReviewLabel: UILabel!
    
    // views
    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var roundView: UIView!
    
    
    var model: Vehicle?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setup() {
        self.roundView.layer.cornerRadius = 5
        self.roundView.clipsToBounds = true
        self.shadowView.layer.borderWidth = 1
        self.shadowView.layer.borderColor = AppConstants.textfieldShadowColor.cgColor
        shadowView.layer.addShadow(with: UIColor.lightGray, offset: CGSize.init(width: 5, height: 5))
        self.typeLabel.layer.cornerRadius = 8
        self.typeLabel.clipsToBounds = true
    }
}
