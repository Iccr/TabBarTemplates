//
//  ProductListWireframe.swift
//  TabController
//
//  Created by gme_2 on 07/11/2018.
//Copyright © 2018 ccr. All rights reserved.
//

import UIKit

class ProductListWireframe {
     weak var view: UIViewController!
}

extension ProductListWireframe: ProductListWireframeInput {
    
    var storyboardName: String {return "ProductList"}
    
    func getMainView() -> UIViewController {
        let service = ProductListService()
        let interactor = ProductListInteractor(service: service)
        let presenter = ProductListPresenter()
        let viewController = viewControllerFromStoryboard(of: ProductListViewController.self)
        
        viewController.presenter = presenter
        interactor.output = presenter
        presenter.interactor = interactor
        presenter.wireframe = self
        presenter.view = viewController
        
        self.view = viewController
        return viewController
    }
}
