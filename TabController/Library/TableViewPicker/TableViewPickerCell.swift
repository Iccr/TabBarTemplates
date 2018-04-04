//
//  TableViewPickerCell.swift
//  Sipradi
//
//  Created by shishir sapkota on 7/25/17.
//  Copyright © 2017 Ekbana. All rights reserved.
//

import UIKit


class TableViewPickerCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override var isSelected: Bool {
        get {
            return super.isSelected
        }
        set {
            super.isSelected = newValue
            self.selectedStatusChanged()
        }
    }
    
    private func selectedStatusChanged() {
    }
}
