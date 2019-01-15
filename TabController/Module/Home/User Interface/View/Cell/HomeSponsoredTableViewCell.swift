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
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setup() {
        seeTicketButton.rounded()
    }
}
