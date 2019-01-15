//
//  RegisterPresenter.swift
//  GMERemittance
//
//  Created by gme_2 on 10/09/2018.
//Copyright © 2018 Gobal Money Express Co. Ltd. All rights reserved.
//

import Foundation

class RegisterPresenter {
    
	// MARK: Properties
    
    weak var view: RegisterViewInterface?
    var interactor: RegisterInteractorInput?
    var wireframe: RegisterWireframeInput?

    // MARK: Converting entities
}

 // MARK: Register module interface

extension RegisterPresenter: RegisterModuleInterface {
    func register(model: RegisterRequestModel) {
        self.view?.showLoading()
        self.interactor?.register(model: model)
    }
    
    func login() {
        self.wireframe?.login()
    }

}

// MARK: Register interactor output interface

extension RegisterPresenter: RegisterInteractorOutput {
    func show(error: Error) {
        self.view?.hideLoading()
        self.view?.show(error: error.localizedDescription)
    }
    
    func success(message: String) {
        self.view?.hideLoading()
        self.view?.show(message: message)
    }
}
