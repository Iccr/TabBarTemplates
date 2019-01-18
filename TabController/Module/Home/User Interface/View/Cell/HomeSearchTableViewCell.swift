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
    
    @IBOutlet weak var numberOfPassengerLabel: UILabel!
    @IBOutlet weak var numberOfPassengerStackView: UIStackView!
    
    var model: SearchRequestModel?
    private var numberTapGesture: UITapGestureRecognizer?
    
    var searchdelegate: HomeSearchDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    func setup() {
        self.configureViews()
        configureGestures()
        populateInfo()
    }
    
    private func populateInfo() {
        let numberOfPassenger = self.model?.numberOfPassengers ?? "0"
        let numberOfRoom = self.model?.numberOfRooms ?? "0"
        
        let text = "\(numberOfPassenger) Passenger, \(numberOfRoom) rooms"
        self.numberOfPassengerLabel.text = text
    }

    private func configureViews() {
        setupShadows()
        searchButton.rounded()
        self.backGroundView.layer.cornerRadius = 10
        setupTextFields()
    }
    
    private func configureGestures() {
        let gesture = UITapGestureRecognizer()
        self.numberTapGesture = gesture
        numberTapGesture?.addTarget(self, action: #selector(self.passengerNumberSelection(_:)))
        self.numberOfPassengerStackView.addGestureRecognizer(gesture)
    }
    
    
    // @IBAction
    @IBAction func search(_ sender: Any) {
        model?.from = self.fromDestinationTextField.text!
        model?.to = self.toDestinationTextField.text!
        model?.checkInDate = self.checkInDateTextField.text!
        model?.checkOutDate = self.checkOutDateTextField.text!
        searchdelegate?.search(model: model)
    }
    
    private func setupTextFields() {
        // destinations textfields
        let yelloImageView = UIImageView.init(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        yelloImageView.image = UIImage.init(named: "yelloLocation")
        let blueDotImageView  = UIImageView.init(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        blueDotImageView.image = UIImage.init(named: "blueDot.png")
        yelloImageView.contentMode = .scaleAspectFit
        blueDotImageView.contentMode = .scaleAspectFit
        fromDestinationTextField.leftView = yelloImageView
        fromDestinationTextField.leftViewMode = .always
        toDestinationTextField.leftView = blueDotImageView
        toDestinationTextField.leftViewMode = .always
        
        // dates textfields
        let calendarImageView1 = UIImageView.init(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        calendarImageView1.image = UIImage.init(named: "calendar.png")
        let calendarImageView2  = UIImageView.init(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        calendarImageView2.image = UIImage.init(named: "calendar.png")
        calendarImageView1.contentMode = .scaleAspectFit
        calendarImageView2.contentMode = .scaleAspectFit
        checkInDateTextField.leftView = calendarImageView1
        checkInDateTextField.leftViewMode = .always
        checkOutDateTextField.leftView = calendarImageView2
        checkOutDateTextField.leftViewMode = .always
    }
    
    private func setupShadows() {
        [fromDestinationTextField, toDestinationTextField, checkInDateTextField, checkOutDateTextField].forEach({
            $0?.layer.borderWidth = 1
            $0?.layer.borderColor = AppConstants.textfieldShadowColor.cgColor
            
            $0?.layer.addShadow(offset: CGSize.init(width: 1.5, height: 2))
        })
        self.addAttributesToTextfield(textfield: fromDestinationTextField, placeholder: "From")
        self.addAttributesToTextfield(textfield: toDestinationTextField, placeholder: "To")
        self.addAttributesToTextfield(textfield: checkInDateTextField, placeholder: "Check in")
        self.addAttributesToTextfield(textfield: checkOutDateTextField, placeholder: "Check out")
        
    }
    
    private func addAttributesToTextfield(textfield: UITextField?, placeholder: String) {
        let attributes = [NSAttributedStringKey.foregroundColor: UIColor.lightGray,
                          .font : UIFont.systemFont(ofSize: 12, weight: .regular)]
        
        textfield?.attributedPlaceholder = NSAttributedString(string: placeholder, attributes:attributes)
    }
    
    @objc func passengerNumberSelection(_ sender: Any) {
        NotificationCenter.default.post(name: HomeNotification.getPassengerNumberSelection(), object: nil)
    }

}
