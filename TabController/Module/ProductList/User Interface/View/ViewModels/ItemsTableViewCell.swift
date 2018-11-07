//
//  ItemsTableViewCell.swift
//  TabController
//
//  Created by gme_2 on 07/11/2018.
//  Copyright © 2018 ccr. All rights reserved.
//

import UIKit

import RealmSwift

class ItemsTableViewCell: UITableViewCell {
    
    var item: SearchItem?
    var index: Int?
    
    @IBOutlet weak var categoryTextField: UITextField!
    @IBOutlet weak var sizeTextfield: UITextField!
    @IBOutlet weak var colorTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var numberOfTabsTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var cardTextField: UITextField!
    
    func setup() {
        show()
    }
    
    private func show() {
        categoryTextField.text = item?.cateogry
        sizeTextfield.text = item?.size
        colorTextField.text = item?.color
        nameTextField.text = item?.name
        numberOfTabsTextField.text = item?.numberOfTabls
        addressTextField.text = item?.address
        cardTextField.text = item?.card
    }
}



class SearchItem: Object {
    @objc var cateogry: String?
    @objc var size: String?
    @objc var color: String?
    @objc var name: String?
    @objc var numberOfTabls: String?
    @objc var address: String?
    @objc var card: String?
    
    
    override class func primaryKey() -> String? {
        return "name"
    }
}


