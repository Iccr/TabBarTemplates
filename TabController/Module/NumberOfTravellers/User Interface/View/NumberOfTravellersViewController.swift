//
//  NumberOfTravellersViewController.swift
//  TabController
//
//  Created by gme_2 on 18/01/2019.
//Copyright © 2019 ccr. All rights reserved.
//

import UIKit


class NumberOfTravellersViewController: UIViewController {
    
    // MARK: IBOutlets
    
    @IBOutlet weak var transparentView: UIView!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var doneButton: UIButton!
    
    @IBOutlet weak var passengerIncreamentButton: UIButton!
    @IBOutlet weak var passengerDecreamentButton: UIButton!
    @IBOutlet weak var roomIncreamentButton: UIButton!
    @IBOutlet weak var roomDecreamentButton: UIButton!
    
    @IBOutlet weak var roomCountLabel: UILabel!
    @IBOutlet weak var passengerCountLabel: UILabel!
    
    // MARK: Properties
    
    var passengerCount: Int = 1 {
        didSet {
            self.passengerCountLabel.text = "\(passengerCount)"
        }
    }
    var roomCount: Int = 1 {
        didSet {
            self.roomCountLabel.text = "\(roomCount)"
        }
    }
    
    var presenter: NumberOfTravellersModuleInterface?
    
    var model: SearchRequestModel?
    

    // MARK: VC's Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }
    
    // MARK: IBActions
    
    // MARK: Other Functions
    
    private func setup() {
        // all setup should be done here
       [passengerIncreamentButton, passengerDecreamentButton, roomIncreamentButton, roomDecreamentButton, doneButton ].forEach({$0?.rounded()})
        populateValues()
    }
    
    
    private func populateValues() {
        if let count = Int(model?.numberOfPassengers ?? "1") {
            self.passengerCount = count
        }
        
        if let count = Int(model?.numberOfRooms ?? "1") {
            self.roomCount = count
        }
    }

    

    @IBAction func close(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func decreasePassengerCount(_ sender: Any) {
        if self.passengerCount <= 1 {
            self.passengerCount = 1
            return
        }
        passengerCount = passengerCount - 1
    }
    
    @IBAction func increasePassengerCount(_ sender: Any) {
        passengerCount = passengerCount + 1
    }
    
    @IBAction func decreaseRoomCount(_ sender: Any) {
        if self.roomCount <= 1 {
            self.roomCount = 1
            return
        }
        roomCount = roomCount - 1
    }
    
    @IBAction func increaseRoomCount(_ sender: Any) {
        roomCount = roomCount + 1
    }
    
}

// MARK: NumberOfTravellersViewInterface
extension NumberOfTravellersViewController: NumberOfTravellersViewInterface {
    
}


extension NumberOfTravellersViewController: UIGestureRecognizerDelegate {
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        let view = gestureRecognizer.view
        let isNotSubView =  view?.superview != transparentView
        let isValid = view?.tag == transparentView.tag
        return isNotSubView && isValid
    }
}
