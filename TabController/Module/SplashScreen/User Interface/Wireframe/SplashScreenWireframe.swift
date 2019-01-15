//
//  SplashScreenWireframe.swift
//  GMERemittance
//
//  Created by gme_2 on 10/09/2018.
//Copyright © 2018 Gobal Money Express Co. Ltd. All rights reserved.
//

import UIKit

class SplashScreenWireframe {
     weak var view: UIViewController!
     lazy var loginWireframe = LoginWireframe()
     lazy var registerWireFrame = RegisterWireframe()
}

extension SplashScreenWireframe: SplashScreenWireframeInput {
    
    var storyboardName: String {return "SplashScreen"}
    
    func getMainView() -> UIViewController {
        let service = SplashScreenService()
        let interactor = SplashScreenInteractor(service: service)
        let presenter = SplashScreenPresenter()
        let viewController = viewControllerFromStoryboard(of: SplashScreenViewController.self)
        
        viewController.presenter = presenter
        interactor.output = presenter
        presenter.interactor = interactor
        presenter.wireframe = self
        presenter.view = viewController
        
        self.view = viewController
        return viewController
    }
    
    func login() {
        if let navigation = self.view.navigationController {
            loginWireframe.pushMainView(in: navigation)
        }
    }
    
    func register() {
        if let navigation = self.view.navigationController {
            registerWireFrame.openRegistrationFromSplash(source: navigation)
        }
    }
}

