//
//  ForgotPasswordWireframe.swift
//  GMERemittance
//
//  Created by gme_2 on 11/09/2018.
//Copyright © 2018 Gobal Money Express Co. Ltd. All rights reserved.
//

import UIKit

class ForgotPasswordWireframe {
     weak var view: UIViewController!
}

extension ForgotPasswordWireframe: ForgotPasswordWireframeInput {
    
    var storyboardName: String {return "ForgotPassword"}
    
    func getMainView() -> UIViewController {
        let service = ForgotPasswordService()
        let interactor = ForgotPasswordInteractor(service: service)
        let presenter = ForgotPasswordPresenter()
        let viewController = viewControllerFromStoryboard(of: ForgotPasswordViewController.self)
        
        viewController.presenter = presenter
        interactor.output = presenter
        presenter.interactor = interactor
        presenter.wireframe = self
        presenter.view = viewController
        
        self.view = viewController
        return viewController
    }
    
    func login() {
        self.view.navigationController?.popViewController(animated: true)
    }
}
