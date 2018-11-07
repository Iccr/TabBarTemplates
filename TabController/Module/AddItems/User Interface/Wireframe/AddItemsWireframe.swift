//
//  AddItemsWireframe.swift
//  TabController
//
//  Created by gme_2 on 07/11/2018.
//Copyright © 2018 ccr. All rights reserved.
//

import UIKit

class AddItemsWireframe {
     weak var view: UIViewController!
}

extension AddItemsWireframe: AddItemsWireframeInput {
    
    var storyboardName: String {return "AddItems"}
    
    func getMainView() -> UIViewController {
        let service = AddItemsService()
        let interactor = AddItemsInteractor(service: service)
        let presenter = AddItemsPresenter()
        let viewController = viewControllerFromStoryboard(of: AddItemsViewController.self)
        
        viewController.presenter = presenter
        interactor.output = presenter
        presenter.interactor = interactor
        presenter.wireframe = self
        presenter.view = viewController
        
        self.view = viewController
        return viewController
    }
}
