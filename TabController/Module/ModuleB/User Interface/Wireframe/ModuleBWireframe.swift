//
//  ModuleBWireframe.swift
//  TabController
//
//  Created by shishir sapkota on 4/4/18.
//Copyright © 2018 ccr. All rights reserved.
//

import UIKit

class ModuleBWireframe {
     weak var view: UIViewController!
}

extension ModuleBWireframe: ModuleBWireframeInput {
    
    var storyboardName: String {return "ModuleB"}
    
    func getMainView() -> UIViewController {
        let service = ModuleBService()
        let interactor = ModuleBInteractor(service: service)
        let presenter = ModuleBPresenter()
        let viewController = viewControllerFromStoryboard(of: ModuleBViewController.self)
        
        viewController.presenter = presenter
        interactor.output = presenter
        presenter.interactor = interactor
        presenter.wireframe = self
        presenter.view = viewController
        
        self.view = viewController
        return viewController
    }
}
