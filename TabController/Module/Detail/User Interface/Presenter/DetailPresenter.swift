//
//  DetailPresenter.swift
//  TabController
//
//  Created by shishir sapkota on 1/16/19.
//Copyright © 2019 ccr. All rights reserved.
//

import Foundation

class DetailPresenter {
    
	// MARK: Properties
    
    weak var view: DetailViewInterface?
    var interactor: DetailInteractorInput?
    var wireframe: DetailWireframeInput?

    // MARK: Converting entities
}

 // MARK: Detail module interface

extension DetailPresenter: DetailModuleInterface {
    
}

// MARK: Detail interactor output interface

extension DetailPresenter: DetailInteractorOutput {
    
}
