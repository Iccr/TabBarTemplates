//
//  HomeSponsoredTableViewCell.swift
//  TabController
//
//  Created by shishir sapkota on 1/16/19.
//  Copyright © 2019 ccr. All rights reserved.
//

import UIKit

class HomeSponsoredTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var vehicleImageView: UIImageView!
    @IBOutlet weak var seeTicketButton: UIButton!
    @IBOutlet weak var offerLabel: UILabel!
    @IBOutlet weak var numberOfDestinationLabel: UILabel!
    
    @IBOutlet weak var fromToDestinationNameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var galleryImageView1: UIImageView!
    @IBOutlet weak var galleryImageView2: UIImageView!
    
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var favouriteButton: UIButton!
    
    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var roundView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setup() {
        seeTicketButton.rounded()
        self.galleryImageView1.layer.cornerRadius = 10
        self.galleryImageView2.layer.cornerRadius = 10
        roundView.layer.cornerRadius = 8
        roundView.clipsToBounds = true
        [shadowView].forEach({
            $0?.layer.borderWidth = 1
            $0?.layer.borderColor = UIColor.init(hex: "#F8F8F8", alpha: 1).cgColor

            $0?.layer.addShadow(offset: CGSize.init(width:2, height: 3))
        })
    }
}
