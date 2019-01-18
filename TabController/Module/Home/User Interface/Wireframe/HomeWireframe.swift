//
//  HomeWireframe.swift
//  TabController
//
//  Created by gme_2 on 15/01/2019.
//Copyright © 2019 ccr. All rights reserved.
//

import UIKit

class HomeWireframe {
     weak var view: UIViewController!
    private lazy var listWireframe = ListingWireframe()
    let numberOfTravellersWireframe = NumberOfTravellersWireframe()
}

extension HomeWireframe: HomeWireframeInput {
    
    var storyboardName: String {return "Home"}
    
    func getMainView() -> UIViewController {
        let service = HomeService()
        let interactor = HomeInteractor(service: service)
        let presenter = HomePresenter()
        let viewController = viewControllerFromStoryboard(of: HomeViewController.self)
        
        viewController.presenter = presenter
        interactor.output = presenter
        presenter.interactor = interactor
        presenter.wireframe = self
        presenter.view = viewController
        
        self.view = viewController
        return viewController
    }
    
    func showList(models: [Hotel], for request: SearchRequestModel?) {
        if let navigation = self.view.navigationController {
            listWireframe.openList(models: models, request: request, source: navigation)
        }
    }
    
    func openNumberOfTravellersSelection() {
        numberOfTravellersWireframe.openMainView(source: view)
    }
}
