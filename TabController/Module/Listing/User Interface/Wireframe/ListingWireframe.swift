//
//  ListingWireframe.swift
//  TabController
//
//  Created by gme_2 on 16/01/2019.
//Copyright © 2019 ccr. All rights reserved.
//

import UIKit

class ListingWireframe {
     weak var view: UIViewController!
    var models: [Vehicle]?
}

extension ListingWireframe: ListingWireframeInput {
    
    var storyboardName: String {return "VehicleListing"}
    
    func getMainView() -> UIViewController {
        let service = ListingService()
        let interactor = ListingInteractor(service: service, models: self.models)
        let presenter = ListingPresenter()
        let viewController = viewControllerFromStoryboard(of: ListingViewController.self)
        
        viewController.presenter = presenter
        interactor.output = presenter
        presenter.interactor = interactor
        presenter.wireframe = self
        presenter.view = viewController
        
        self.view = viewController
        return viewController
    }
    
    func openList(models: [Vehicle], source: UINavigationController) {
        self.models = models
        self.pushMainView(in: source)
    }
}
