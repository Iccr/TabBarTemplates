//
//  LoadingPresenter.swift
//  TabController
//
//  Created by shishir sapkota on 4/4/18.
//Copyright © 2018 ccr. All rights reserved.
//

import Foundation

class LoadingPresenter {
    
	// MARK: Properties
    
    weak var view: LoadingViewInterface?
    var interactor: LoadingInteractorInput?
    var wireframe: LoadingWireframe?

    // MARK: Converting entities
}

 // MARK: Loading module interface

extension LoadingPresenter: LoadingModuleInterface {
    func viewIsReady() {
        self.wireframe?.showMainView()
    }
    
    
}

// MARK: Loading interactor output interface

extension LoadingPresenter: LoadingInteractorOutput {
    
}
