//
//  HomeSearchTableViewCell.swift
//  TabController
//
//  Created by gme_2 on 15/01/2019.
//  Copyright © 2019 ccr. All rights reserved.
//

import UIKit

class HomeSearchTableViewCell: UITableViewCell {

    @IBOutlet weak var fromDestinationTextField: UITextField!
    @IBOutlet weak var toDestinationTextField: UITextField!
    @IBOutlet weak var checkInDateTextField: UITextField!
    @IBOutlet weak var checkOutDateTextField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var backGroundView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    func setup() {
        self.configureViews()
    }

    private func configureViews() {
        setupShadows()
        searchButton.rounded()
         
    }
    
    private func setupShadows() {
        [fromDestinationTextField, toDestinationTextField, checkInDateTextField, checkOutDateTextField].forEach({
            $0?.layer.borderWidth = 0.1
            $0?.layer.addShadow(offset: CGSize.init(width: 1, height: 1.8))
        })
        self.addAttributesToTextfield(textfield: fromDestinationTextField, placeholder: "From")
        self.addAttributesToTextfield(textfield: toDestinationTextField, placeholder: "To")
        self.addAttributesToTextfield(textfield: checkInDateTextField, placeholder: "Check in")
        self.addAttributesToTextfield(textfield: checkOutDateTextField, placeholder: "Check out")
        
    }
    
    private func addAttributesToTextfield(textfield: UITextField?, placeholder: String) {
        let attributes = [NSAttributedStringKey.foregroundColor: UIColor.lightGray,
                          .font : UIFont.systemFont(ofSize: 9, weight: .regular)]
        
        textfield?.attributedPlaceholder = NSAttributedString(string: placeholder, attributes:attributes)
    }

}
