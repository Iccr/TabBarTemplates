//
//  LoadingWireframe.swift
//  TabController
//
//  Created by shishir sapkota on 4/4/18.
//Copyright © 2018 ccr. All rights reserved.
//

import UIKit

class LoadingWireframe {
     weak var view: UIViewController!
    private lazy var mainWireframe: MainWireframeInput = {return MainWireframe.shared}()
}

extension LoadingWireframe: LoadingWireframeInput {
    
    var storyboardName: String {return "Loading"}
    
    func getMainView() -> UIViewController {
        let service = LoadingService()
        let interactor = LoadingInteractor(service: service)
        let presenter = LoadingPresenter()
        let viewController = viewControllerFromStoryboard(of: LoadingViewController.self)
        
        viewController.presenter = presenter
        interactor.output = presenter
        presenter.interactor = interactor
        presenter.wireframe = self
        presenter.view = viewController
        
        self.view = viewController
        return viewController
    }
    
    func showMainView() {
        if let window = self.window {
            self.mainWireframe.openMainViewIn(window: window)
        }
    }
}
