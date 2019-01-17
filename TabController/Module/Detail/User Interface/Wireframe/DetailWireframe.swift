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
    var model: Hotel?
    var request: SearchRequestModel?
    lazy var confirmationWireFrame = ConfirmationWireframe()
}

extension DetailWireframe: DetailWireframeInput {
    
    var storyboardName: String {return "Detail"}
    
    func getMainView() -> UIViewController {
        let service = DetailService()
        let interactor = DetailInteractor(service: service, model: self.model, request: self.request)
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
    
    func openDetail(model: Hotel, request: SearchRequestModel?, source: UINavigationController) {
        self.model = model
        self.request = request
        self.pushMainView(in: source)
    }
    
    func openConfirmation(for hotel: Hotel, and request: SearchRequestModel?) {
        if let navigation = self.view.navigationController {
            self.confirmationWireFrame.openConformation(model: hotel, request: request, source: navigation)
        }
    }
}
