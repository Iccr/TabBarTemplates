//
//  LoginPresenter.swift
//  GMERemittance
//
//  Created by gme_2 on 07/09/2018.
//Copyright © 2018 Gobal Money Express Co. Ltd. All rights reserved.
//

import Foundation

class LoginPresenter {
    
	// MARK: Properties
    
    weak var view: LoginViewInterface?
    var interactor: LoginInteractorInput?
    var wireframe: LoginWireframeInput?

    // MARK: Converting entities
}

 // MARK: Login module interface

extension LoginPresenter: LoginModuleInterface {
    func login(userName: String, password: String) {
        self.view?.showLoading()
        self.interactor?.login(username: userName, password: password)
    }
    
    
    func register() {
        self.wireframe?.register()
    }
    
    func forgotPassword() {
        self.wireframe?.forgotPassword()
    }
}

// MARK: Login interactor output interface

extension LoginPresenter: LoginInteractorOutput {
    func show(error: Error) {
        self.view?.hideLoading()
        self.view?.show(error: error.localizedDescription)
    }
    
    func loggedIn() {
        self.view?.hideLoading()
        self.wireframe?.dashBoard()
    }
}
