//
//  ModuleDWireframe.swift
//  TabController
//
//  Created by shishir sapkota on 4/4/18.
//Copyright © 2018 ccr. All rights reserved.
//

import UIKit

class ModuleDWireframe {
     weak var view: UIViewController!
}

extension ModuleDWireframe: ModuleDWireframeInput {
    
    var storyboardName: String {return "ModuleD"}
    
    func getMainView() -> UIViewController {
        let service = ModuleDService()
        let interactor = ModuleDInteractor(service: service)
        let presenter = ModuleDPresenter()
        let viewController = viewControllerFromStoryboard(of: ModuleDViewController.self)
        
        viewController.presenter = presenter
        interactor.output = presenter
        presenter.interactor = interactor
        presenter.wireframe = self
        presenter.view = viewController
        
        self.view = viewController
        return viewController
    }
}
