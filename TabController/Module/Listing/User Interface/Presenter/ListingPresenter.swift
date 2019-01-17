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
    
    var request: SearchRequestModel?

    // MARK: Converting entities
}

 // MARK: Listing module interface

extension ListingPresenter: ListingModuleInterface {
    func show(models: [Hotel]) {
        view?.show(models: models)
    }
    
    func show(request: SearchRequestModel) {
        self.request = request
    }
}

// MARK: Listing interactor output interface

extension ListingPresenter: ListingInteractorOutput {
    func viewIsReady() {
        interactor?.viewIsReady()
    }
    
    func openDetail(for model: Hotel) {
        wireframe?.openDetail(for: model, for: self.request )
    }
}
