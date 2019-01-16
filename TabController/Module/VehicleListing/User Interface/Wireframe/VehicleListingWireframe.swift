//
//  VehicleListingWireframe.swift
//  TabController
//
//  Created by gme_2 on 16/01/2019.
//Copyright © 2019 ccr. All rights reserved.
//

import UIKit

class VehicleListingWireframe {
     weak var view: UIViewController!
}

extension VehicleListingWireframe: VehicleListingWireframeInput {
    
    var storyboardName: String {return "VehicleListing"}
    
    func getMainView() -> UIViewController {
        let service = VehicleListingService()
        let interactor = VehicleListingInteractor(service: service)
        let presenter = VehicleListingPresenter()
        let viewController = viewControllerFromStoryboard(of: VehicleListingViewController.self)
        
        viewController.presenter = presenter
        interactor.output = presenter
        presenter.interactor = interactor
        presenter.wireframe = self
        presenter.view = viewController
        
        self.view = viewController
        return viewController
    }
}
