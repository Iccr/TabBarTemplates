//
//  SettingWireframe.swift
//  TabController
//
//  Created by gme_2 on 07/11/2018.
//Copyright © 2018 ccr. All rights reserved.
//

import UIKit

class SettingWireframe {
     weak var view: UIViewController!
}

extension SettingWireframe: SettingWireframeInput {
    
    var storyboardName: String {return "Setting"}
    
    func getMainView() -> UIViewController {
        let service = SettingService()
        let interactor = SettingInteractor(service: service)
        let presenter = SettingPresenter()
        let viewController = viewControllerFromStoryboard(of: SettingViewController.self)
        
        viewController.presenter = presenter
        interactor.output = presenter
        presenter.interactor = interactor
        presenter.wireframe = self
        presenter.view = viewController
        
        self.view = viewController
        return viewController
    }
}
