//
//  LanguageCell.swift
//  Tsukasa
//
//  Created by Lizan Pradhanang on 8/16/17.
//  Copyright © 2017 Lizan Pradhanang. All rights reserved.
//

import UIKit

class LanguageCell: UITableViewCell {

    @IBOutlet weak var languageNameLabel: UILabel!
    var language:String?
    var choosen: Bool = false
    
    func setup() {
        languageNameLabel.text = language
        self.languageNameLabel.textColor = choosen ? Colors.defaultRed : .black
    }
}
