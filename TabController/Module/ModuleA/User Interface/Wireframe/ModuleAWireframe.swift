//
//  ModuleAWireframe.swift
//  TabController
//
//  Created by shishir sapkota on 4/4/18.
//Copyright © 2018 ccr. All rights reserved.
//

import UIKit

class ModuleAWireframe {
     weak var view: UIViewController!
}

extension ModuleAWireframe: ModuleAWireframeInput {
    
    var storyboardName: String {return "ModuleA"}
    
    func getMainView() -> UIViewController {
        let service = ModuleAService()
        let interactor = ModuleAInteractor(service: service)
        let presenter = ModuleAPresenter()
        let viewController = viewControllerFromStoryboard(of: ModuleAViewController.self)
        
        viewController.presenter = presenter
        interactor.output = presenter
        presenter.interactor = interactor
        presenter.wireframe = self
        presenter.view = viewController
        
        self.view = viewController
        return viewController
    }
}
