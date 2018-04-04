//
//  ModuleCWireframe.swift
//  TabController
//
//  Created by shishir sapkota on 4/4/18.
//Copyright © 2018 ccr. All rights reserved.
//

import UIKit

class ModuleCWireframe {
     weak var view: UIViewController!
}

extension ModuleCWireframe: ModuleCWireframeInput {
    
    var storyboardName: String {return "ModuleC"}
    
    func getMainView() -> UIViewController {
        let service = ModuleCService()
        let interactor = ModuleCInteractor(service: service)
        let presenter = ModuleCPresenter()
        let viewController = viewControllerFromStoryboard(of: ModuleCViewController.self)
        
        viewController.presenter = presenter
        interactor.output = presenter
        presenter.interactor = interactor
        presenter.wireframe = self
        presenter.view = viewController
        
        self.view = viewController
        return viewController
    }
}
