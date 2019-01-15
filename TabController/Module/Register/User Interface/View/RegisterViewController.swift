//
//  RegisterViewController.swift
//  GMERemittance
//
//  Created by gme_2 on 10/09/2018.
//Copyright © 2018 Gobal Money Express Co. Ltd. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    
    // MARK: IBOutlets
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextfield: UITextField!
    @IBOutlet weak var dobTextField: UITextField!
    
    
    // MARK: Properties
    let datePicker = UIDatePicker()
    var presenter: RegisterModuleInterface?

    // MARK: VC's Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationItem.title = ""
    }
    
    // MARK: IBActions
    
    @IBAction func login(_ sender: UIButton) {
        self.presenter?.login()
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
    
    @IBAction func register(_ sender: UIButton) {
        let email = self.emailTextField.text!
        let password = self.passwordTextField.text!
        let dob = self.dobTextField.text!
        let confirmPassword = self.confirmPasswordTextfield.text!
        let model = RegisterRequestModel()
        model.username = email
        model.password = password
        model.confirmPassword = confirmPassword
        model.dob = dob
        self.presenter?.register(model: model)
    }
    
    // MARK: Other Functions
    
    private func setup() {
        // all setup should be done here
//        self.setupPicturedNavBar()
        self.setupDatePicker()
       
    }
}

// MARK: RegisterViewInterface
extension RegisterViewController: RegisterViewInterface {
    func showLoading() {
        self.showProgressHud()
    }
    
    func hideLoading() {
        self.hideProgressHud()
    }
    
    func show(error: String) {
        self.alert(message: error)
    }
    
    func show(message: String) {
        self.alertWithOk(message: message, title: "Success", okTitle: "Ok") {
            self.presenter?.login()
        }
    }
}
