//
//  DetailWireframe.swift
//  TabController
//
//  Created by shishir sapkota on 1/16/19.
//Copyright © 2019 ccr. All rights reserved.
//

import UIKit

class DetailWireframe {
     weak var view: UIViewController!
}

extension DetailWireframe: DetailWireframeInput {
    
    var storyboardName: String {return "Detail"}
    
    func getMainView() -> UIViewController {
        let service = DetailService()
        let interactor = DetailInteractor(service: service)
        let presenter = DetailPresenter()
        let viewController = viewControllerFromStoryboard(of: DetailViewController.self)
        
        viewController.presenter = presenter
        interactor.output = presenter
        presenter.interactor = interactor
        presenter.wireframe = self
        presenter.view = viewController
        
        self.view = viewController
        return viewController
    }
}
