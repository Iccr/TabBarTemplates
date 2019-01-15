//
//  ForgotPasswordPresenter.swift
//  GMERemittance
//
//  Created by gme_2 on 11/09/2018.
//Copyright © 2018 Gobal Money Express Co. Ltd. All rights reserved.
//

import Foundation

class ForgotPasswordPresenter {
    
	// MARK: Properties
    
    weak var view: ForgotPasswordViewInterface?
    var interactor: ForgotPasswordInteractorInput?
    var wireframe: ForgotPasswordWireframeInput?

    // MARK: Converting entities
}

 // MARK: ForgotPassword module interface

extension ForgotPasswordPresenter: ForgotPasswordModuleInterface {
    func reset(username: String, dob: String) {
        self.view?.showLoading()
        self.interactor?.reset(username: username, dob: dob)
    }
    
    func cancel() {
        self.wireframe?.login()
    }
}

// MARK: ForgotPassword interactor output interface

extension ForgotPasswordPresenter: ForgotPasswordInteractorOutput {
    func show(error: Error) {
        self.view?.hideLoading()
        self.view?.show(error: error.localizedDescription)
    }
    
    func show(message: String) {
        self.view?.hideLoading()
        self.view?.show(message: message)
    }
}
