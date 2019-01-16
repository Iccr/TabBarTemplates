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
    
    func showList(models: [Vehicle]) {
        
    }
}
