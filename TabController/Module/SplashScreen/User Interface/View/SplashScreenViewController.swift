//
//  SplashScreenViewController.swift
//  GMERemittance
//
//  Created by gme_2 on 10/09/2018.
//Copyright © 2018 Gobal Money Express Co. Ltd. All rights reserved.
//

import UIKit

class SplashScreenViewController: UIViewController {
    
    // MARK: IBOutlets
    
    @IBOutlet weak var buttonLogin: UIButton!
    @IBOutlet weak var buttonSignUp: UIButton!
    
    // MARK: Properties
    
    
    var counter: Int = 0
    

    
    
    var presenter: SplashScreenModuleInterface?
    

    // MARK: VC's Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationItem.title = ""
        self.hideNavBar()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationItem.title = ""
    }
    
    // MARK: IBActions
    
    @IBAction func login(_ sender: UIButton) {
        self.presenter?.login()
    }
    
    
    @IBAction func register(_ sender: UIButton) {
        self.presenter?.register()
    }
    
    // MARK: Other Functions
    
    private func hideNavBar() {
        self.navigationController?.isNavigationBarHidden = true
        self.navigationController?.navigationBar.barTintColor = AppConstants.themWhiteColor
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    private func setup() {
        // all setup should be done here
        hideNavBar()
        setUpButtons()
    }
    
   
    
    func setUpButtons() {
        buttonSignUp.layer.cornerRadius = 25
        buttonLogin.backgroundColor = .clear
        buttonLogin.layer.cornerRadius = 25
        buttonLogin.layer.borderWidth = 1
        buttonLogin.layer.borderColor = UIColor.white.cgColor
        buttonSignUp.layer.borderWidth = 1
        buttonSignUp.layer.borderColor = UIColor.white.cgColor
        self.view.backgroundColor = AppConstants.themeRedColor
        self.buttonSignUp.backgroundColor = AppConstants.themeDarkRedColor
        self.buttonLogin.backgroundColor = AppConstants.themeBlueColor
//        self.buttonSignUp.backgroundColor = AppConstants.themeBlueColor
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

// MARK: SplashScreenViewInterface
extension SplashScreenViewController: SplashScreenViewInterface {
    
}
