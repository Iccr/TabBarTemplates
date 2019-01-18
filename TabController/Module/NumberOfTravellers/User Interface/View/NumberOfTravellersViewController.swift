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
    
    // MARK: Properties
    
    var presenter: NumberOfTravellersModuleInterface?
    

    // MARK: VC's Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }
    
    // MARK: IBActions
    
    // MARK: Other Functions
    
    private func setup() {
        // all setup should be done here
       self.doneButton.rounded()
    }
    @IBAction func close(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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
