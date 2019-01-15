//
//  LoginWireframe.swift
//  GMERemittance
//
//  Created by gme_2 on 07/09/2018.
//Copyright © 2018 Gobal Money Express Co. Ltd. All rights reserved.
//

import UIKit

//import LGSideMenuController

class LoginWireframe {
     weak var view: UIViewController!
    lazy var mainWireframe = MainWireframe.shared
    lazy var registerWireframe = RegisterWireframe()
    lazy var forgotPasswordWireframe = ForgotPasswordWireframe()
    
}

extension LoginWireframe: LoginWireframeInput {
    
    var storyboardName: String {return "Login"}
    
    func getMainView() -> UIViewController {
        let service = LoginService()
        let interactor = LoginInteractor(service: service)
        let presenter = LoginPresenter()
        let viewController = viewControllerFromStoryboard(of: LoginViewController.self)
        
        viewController.presenter = presenter
        interactor.output = presenter
        presenter.interactor = interactor
        presenter.wireframe = self
        presenter.view = viewController
        
        self.view = viewController
        return viewController
    }
    
    func dashBoard() {
        let mainWireFrame = MainWireframe.shared
        self.window?.rootViewController = mainWireFrame.getMainView()
    }
    
    func register() {
        if let navigation = self.view.navigationController {
            self.registerWireframe.pushMainView(in: navigation)
        }
    }
    
    func forgotPassword() {
        if let navigation = self.view.navigationController {
            self.forgotPasswordWireframe.pushMainView(in: navigation)
        }
    }
}
