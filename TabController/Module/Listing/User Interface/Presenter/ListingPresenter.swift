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

 // MARK: VehicleListing module interface

extension ListingPresenter: ListingModuleInterface {

}

// MARK: VehicleListing interactor output interface

extension ListingPresenter: ListingInteractorOutput {
    
}
