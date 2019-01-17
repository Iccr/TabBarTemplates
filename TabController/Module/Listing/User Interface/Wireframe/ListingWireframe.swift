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
    var models: [Hotel]?
    var request: SearchRequestModel?
    lazy var detailWireframe = DetailWireframe()
}

extension ListingWireframe: ListingWireframeInput {
    
    var storyboardName: String {return "Listing"}
    
    func getMainView() -> UIViewController {
        let service = ListingService()
        let interactor = ListingInteractor(service: service, models: self.models, and: self.request)
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
    
    func openList(models: [Hotel], request: SearchRequestModel? ,source: UINavigationController) {
        self.models = models
        self.request = request
        self.pushMainView(in: source)
    }
    
    func openDetail(for model: Hotel, for request: SearchRequestModel?) {
        if let navigation = self.view.navigationController {
            detailWireframe.openDetail(model: model, request: request, source: navigation)
        }
    }
}
