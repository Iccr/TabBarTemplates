//
//  NumberOfTravellersWireframe.swift
//  TabController
//
//  Created by gme_2 on 18/01/2019.
//Copyright © 2019 ccr. All rights reserved.
//

import UIKit

class NumberOfTravellersWireframe {
     weak var view: UIViewController!
}

extension NumberOfTravellersWireframe: NumberOfTravellersWireframeInput {
    
    var storyboardName: String {return "NumberOfTravellers"}
    
    func getMainView() -> UIViewController {
        let service = NumberOfTravellersService()
        let interactor = NumberOfTravellersInteractor(service: service)
        let presenter = NumberOfTravellersPresenter()
        let viewController = viewControllerFromStoryboard(of: NumberOfTravellersViewController.self)
        
        viewController.presenter = presenter
        interactor.output = presenter
        presenter.interactor = interactor
        presenter.wireframe = self
        presenter.view = viewController
        
        self.view = viewController
        return viewController
    }

}
