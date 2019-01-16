//
//  ListingPresenter.swift
//  TabController
//
//  Created by gme_2 on 16/01/2019.
//Copyright © 2019 ccr. All rights reserved.
//

import Foundation

class ListingPresenter {
    
	// MARK: Properties
    
    weak var view: ListingViewInterface?
    var interactor: ListingInteractorInput?
    var wireframe: ListingWireframeInput?

    // MARK: Converting entities
}

 // MARK: Listing module interface

extension ListingPresenter: ListingModuleInterface {
    func show(models: [Vehicle]) {
        view?.show(models: models)
    }
}

// MARK: Listing interactor output interface

extension ListingPresenter: ListingInteractorOutput {
    func viewIsReady() {
        interactor?.viewIsReady()
    }
}
