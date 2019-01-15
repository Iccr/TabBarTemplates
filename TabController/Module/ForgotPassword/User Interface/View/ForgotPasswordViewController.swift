//
//  ForgotPasswordViewController.swift
//  GMERemittance
//
//  Created by gme_2 on 11/09/2018.
//Copyright © 2018 Gobal Money Express Co. Ltd. All rights reserved.
//

import UIKit

class ForgotPasswordViewController: UIViewController {
    
    // MARK: IBOutlets
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var dobTextField: UITextField!
    
    // MARK: Properties
    
    var presenter: ForgotPasswordModuleInterface?
    let datePicker = UIDatePicker()

    // MARK: VC's Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }
    
    // MARK: IBActions
    
    @IBAction func _continue(_ sender: UIButton) {
        let username = self.userNameTextField.text!
        let dob = self.dobTextField.text!
        self.presenter?.reset(username: username, dob: dob)
    }
    
    @IBAction func cancel(_ sender: UIButton) {
        self.presenter?.cancel()
    }
    
    // MARK: Other Functions
    
    private func setup() {
        // all setup should be done here
    self.setupDatePicker()
//       self.setupPicturedNavBar()\
    }
    
    private func setupDatePicker() {
        self.datePicker.datePickerMode = .date
        self.dobTextField.inputView = datePicker
         datePicker.maximumDate = Date()
        self.datePicker.addTarget(self, action: #selector(handleDatePicker(sender:)), for: .valueChanged)
    }
    
    @objc private func handleDatePicker(sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        self.dobTextField.text = dateFormatter.string(from: sender.date)
    }
}

// MARK: ForgotPasswordViewInterface
extension ForgotPasswordViewController: ForgotPasswordViewInterface {
    func showLoading() {
        self.showProgressHud()
    }
    
    func hideLoading() {
        self.hideProgressHud()
    }
    
    func show(message: String) {
        self.alertWithOk(message: message, title: "Success", okTitle: "Ok") {
            self.presenter?.cancel()
        }
    }
    
    func show(error: String) {
        self.alert(message: error)
    }
}
