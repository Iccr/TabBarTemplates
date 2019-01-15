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
    
    weak var view: HomeViewInterface?
    var interactor: HomeInteractorInput?
    var wireframe: HomeWireframeInput?

    // MARK: Converting entities
}

 // MARK: Home module interface

extension HomePresenter: HomeModuleInterface {

}

// MARK: Home interactor output interface

extension HomePresenter: HomeInteractorOutput {
    
}
