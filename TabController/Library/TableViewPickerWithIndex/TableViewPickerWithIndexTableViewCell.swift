//
//  TableViewPickerWithIndexTableViewCell.swift
//  TabController
//
//  Created by shishir sapkota on 4/4/18.
//Copyright © 2018 ccr. All rights reserved.
//


import UIKit

class TableViewPickerWithIndexTableViewCell: UITableViewCell {
    
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
