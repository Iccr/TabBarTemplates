//
//  RegisterWireframe.swift
//  GMERemittance
//
//  Created by gme_2 on 10/09/2018.
//Copyright © 2018 Gobal Money Express Co. Ltd. All rights reserved.
//

import UIKit

class RegisterWireframe {
     weak var view: UIViewController!
     var isFromSplash: Bool = false
     lazy var loginWireFrame = LoginWireframe()
}

extension RegisterWireframe: RegisterWireframeInput {
    
    var storyboardName: String {return "Register"}
    
    func getMainView() -> UIViewController {
        let service = RegisterService()
        let interactor = RegisterInteractor(service: service)
        let presenter = RegisterPresenter()
        let viewController = viewControllerFromStoryboard(of: RegisterViewController.self)
        
        viewController.presenter = presenter
        interactor.output = presenter
        presenter.interactor = interactor
        presenter.wireframe = self
        presenter.view = viewController
        
        self.view = viewController
        return viewController
    }
    
    func login() {
        if isFromSplash {
            if let navigation = self.view.navigationController {
                loginWireFrame.pushMainView(in: navigation)
            }
        }else {
            self.view.navigationController?.popViewController(animated: true)
        }
    }
    
    func openRegistrationFromSplash(source: UINavigationController) {
        self.isFromSplash = true
        self.pushMainView(in: source)
    }
}
