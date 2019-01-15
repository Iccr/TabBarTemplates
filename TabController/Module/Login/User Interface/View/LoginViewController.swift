//
//  LoginViewController.swift
//  GMERemittance
//
//  Created by gme_2 on 07/09/2018.
//Copyright © 2018 Gobal Money Express Co. Ltd. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: IBOutlets
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    // views
    @IBOutlet weak var backgroundTextfieldsView: UIView!
    @IBOutlet weak var userIdBackgroundView: UIView!
    @IBOutlet weak var passwordBackgroundView: UIView!
    @IBOutlet weak var headerTitle: UILabel!
    @IBOutlet weak var subtitle: UILabel!
    @IBOutlet weak var forgotPasswordView: UIView!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var loginButton: UIButton!

    
    // MARK: Properties

    var presenter: LoginModuleInterface?
    

    // MARK: VC's Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationItem.title = ""
    }
    
    // MARK: IBActions
    @IBAction func forgotPassword(_ sender: UIButton) {
        self.presenter?.forgotPassword()
    }
    
    @IBAction func register(_ sender: UIButton) {
        self.presenter?.register()
    }
    
    @IBAction func login(_ sender: UIButton) {
        let username = self.userNameTextField.text!
        let password = self.passwordTextField.text!
        self.presenter?.login(userName: username, password: password)
    }
    // MARK: Other Functions
    
    private func setup() {
        // all setup should be done here
        setupNavBar()
        setupColor()
//        showAnimation()
    }
    
    func setupColor() {
        self.loginButton.backgroundColor = AppConstants.themeRedColor
        self.headerTitle.textColor = AppConstants.themeRedColor
    }
    
    func showAnimation() {
        setupInitialPositionsOfviews()
        animateViews()
    }
    
    private func setupInitialPositionsOfviews() {
        self.userIdBackgroundView.center.x -= self.view.bounds.width
        self.passwordBackgroundView.center.x -= self.view.bounds.width
        self.loginButton.transform  = CGAffineTransform.init(scaleX: 0, y: 1)
        self.headerTitle.alpha = 0
        self.headerTitle.center.y -= 200
        self.subtitle.alpha = 0
        self.forgotPasswordView.alpha = 0
        self.logoImageView.center.y += (self.logoImageView.bounds.height + 20)
        self.loginButton.setTitle("", for: UIControlState.normal)

    }
    
    private func animateViews() {
        // user id
        UIView.animate(withDuration: 0.5, animations: {
            self.userIdBackgroundView.center.x += self.view.bounds.width
        })
        
        // password
        UIView.animate(withDuration: 0.5, delay: 0.3, options: [], animations: {
            self.passwordBackgroundView.center.x += self.view.bounds.width
        }, completion: nil)
        
        // login button
        UIView.animate(withDuration: 0.5, delay: 0.4, options: [], animations: {
            self.loginButton.transform = CGAffineTransform.identity
        },  completion: { (_) in
            self.loginButton.setTitle("Login", for: UIControlState.normal)
        })
        
        
        // subtitle
        UIView.animate(withDuration: 0.5, delay: 0.7, options: [], animations: {
            self.subtitle.alpha = 1
        }, completion: nil)
        
        // forgot password
        UIView.animate(withDuration: 0.5, delay: 0.9, options: [], animations: {
            self.forgotPasswordView.alpha = 1
        })
        

        
       
        
         // header title
        // logoimageview
        UIView.animate(withDuration: 0.7, delay: 0, options: [], animations: {
            // todo
            self.headerTitle.alpha = 1
            self.headerTitle.center.y += 200
            self.logoImageView.center.y -= (self.logoImageView.bounds.height + 20)
        }, completion: nil)

    }
    
    private func setupNavBar() {
        self.setupPicturedNavBar()
    }
}

// MARK: LoginViewInterface
extension LoginViewController: LoginViewInterface {
    func show(error: String) {
        self.alert(message: error)
    }
    
    func showLoading() {
        self.showProgressHud()
    }
    
    func hideLoading() {
        self.hideProgressHud()
    }
}
