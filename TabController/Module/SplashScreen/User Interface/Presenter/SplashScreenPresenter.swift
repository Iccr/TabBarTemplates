//
//  SplashScreenPresenter.swift
//  GMERemittance
//
//  Created by gme_2 on 10/09/2018.
//Copyright © 2018 Gobal Money Express Co. Ltd. All rights reserved.
//

import Foundation

class SplashScreenPresenter {
    
	// MARK: Properties
    
    weak var view: SplashScreenViewInterface?
    var interactor: SplashScreenInteractorInput?
    var wireframe: SplashScreenWireframeInput?

    // MARK: Converting entities
}

 // MARK: SplashScreen module interface

extension SplashScreenPresenter: SplashScreenModuleInterface {
    func login() {
        self.wireframe?.login()
    }
    
    func register() {
        self.wireframe?.register()
    }
}

// MARK: SplashScreen interactor output interface

extension SplashScreenPresenter: SplashScreenInteractorOutput {
    
}
