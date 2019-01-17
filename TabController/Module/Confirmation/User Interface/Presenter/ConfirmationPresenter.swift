//
//  ConfirmationPresenter.swift
//  TabController
//
//  Created by gme_2 on 17/01/2019.
//Copyright © 2019 ccr. All rights reserved.
//

import Foundation

class ConfirmationPresenter {
    
	// MARK: Properties
    
    weak var view: ConfirmationViewInterface?
    var interactor: ConfirmationInteractorInput?
    var wireframe: ConfirmationWireframeInput?

    // MARK: Converting entities
}

 // MARK: Confirmation module interface

extension ConfirmationPresenter: ConfirmationModuleInterface {
    func viewIsReady() {
        interactor?.viewIsReady()
    }
}

// MARK: Confirmation interactor output interface

extension ConfirmationPresenter: ConfirmationInteractorOutput {
    func show(model: Hotel, request: SearchRequestModel) {
        self.view?.show(model: model, request: request)
    }
}
