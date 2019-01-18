//
//  HomePresenter.swift
//  TabController
//
//  Created by gme_2 on 15/01/2019.
//Copyright © 2019 ccr. All rights reserved.
//

import Foundation

class HomePresenter {
    
	// MARK: Properties
    
    var models: [Hotel]?
    
    weak var view: HomeViewInterface?
    var interactor: HomeInteractorInput?
    var wireframe: HomeWireframeInput?
    var request: SearchRequestModel?

    // MARK: Converting entities
}

 // MARK: Home module interface

extension HomePresenter: HomeModuleInterface {
    func openNumberOfTravellerSelection() {
        self.wireframe?.openNumberOfTravellersSelection()
    }
    
    func search(request: SearchRequestModel) {
        self.request = request
        interactor?.search(request: request)
    }
}

// MARK: Home interactor output interface

extension HomePresenter: HomeInteractorOutput {
    func show(error: Error) {
        self.view?.show(error: error.localizedDescription)
    }
    
    func show(models: [Hotel]) {
        self.wireframe?.showList(models: models, for: self.request)
    }
}
