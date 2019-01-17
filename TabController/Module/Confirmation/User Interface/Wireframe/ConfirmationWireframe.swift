//
//  ConfirmationWireframe.swift
//  TabController
//
//  Created by gme_2 on 17/01/2019.
//Copyright © 2019 ccr. All rights reserved.
//

import UIKit

class ConfirmationWireframe {
     weak var view: UIViewController!
    var model: Hotel?
    var request: SearchRequestModel?
}

extension ConfirmationWireframe: ConfirmationWireframeInput {
    
    var storyboardName: String {return "Confirmation"}
    
    func getMainView() -> UIViewController {
        let service = ConfirmationService()
        let interactor = ConfirmationInteractor(service: service, model: self.model, request: request)
        let presenter = ConfirmationPresenter()
        let viewController = viewControllerFromStoryboard(of: ConfirmationViewController.self)
        
        viewController.presenter = presenter
        interactor.output = presenter
        presenter.interactor = interactor
        presenter.wireframe = self
        presenter.view = viewController
        
        self.view = viewController
        return viewController
    }
    
    func openConformation(model: Hotel?, request: SearchRequestModel?, source: UINavigationController) {
        self.model = model
        self.request = request
        self.pushMainView(in: source)
    }
}
