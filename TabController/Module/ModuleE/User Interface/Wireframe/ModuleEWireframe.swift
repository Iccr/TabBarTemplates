//
//  ModuleEWireframe.swift
//  TabController
//
//  Created by shishir sapkota on 4/4/18.
//Copyright © 2018 ccr. All rights reserved.
//

import UIKit

class ModuleEWireframe {
     weak var view: UIViewController!
}

extension ModuleEWireframe: ModuleEWireframeInput {
    
    var storyboardName: String {return "ModuleE"}
    
    func getMainView() -> UIViewController {
        let service = ModuleEService()
        let interactor = ModuleEInteractor(service: service)
        let presenter = ModuleEPresenter()
        let viewController = viewControllerFromStoryboard(of: ModuleEViewController.self)
        
        viewController.presenter = presenter
        interactor.output = presenter
        presenter.interactor = interactor
        presenter.wireframe = self
        presenter.view = viewController
        
        self.view = viewController
        return viewController
    }
}
