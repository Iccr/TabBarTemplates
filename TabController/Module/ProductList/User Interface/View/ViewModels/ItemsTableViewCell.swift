//
//  ItemsTableViewCell.swift
//  TabController
//
//  Created by gme_2 on 07/11/2018.
//  Copyright © 2018 ccr. All rights reserved.
//

import UIKit

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
    
    public func getItem() -> SearchItem? {
        let item = SearchItem(category: "Accessories")
        item.cateogry = categoryTextField.text!
        item.size = sizeTextfield.text!
        item.color = colorTextField.text!
        item.name = nameTextField.text!
        item.numberOfTabls = numberOfTabsTextField.text!
        item.address = addressTextField.text!
        item.card = cardTextField.text!
        return item
    }

}



class SearchItem {
    var id: Int?
    var cateogry: String?
    var size: String?
    var color: String?
    var name: String?
    var numberOfTabls: String?
    var address: String?
    var card: String?
    
    init(category: String) {
        cateogry = category
    }
}
