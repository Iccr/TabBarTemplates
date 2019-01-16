//
//  VehicleListingPresenter.swift
//  TabController
//
//  Created by gme_2 on 16/01/2019.
//Copyright © 2019 ccr. All rights reserved.
//

import Foundation

class VehicleListingPresenter {
    
	// MARK: Properties
    
    weak var view: VehicleListingViewInterface?
    var interactor: VehicleListingInteractorInput?
    var wireframe: VehicleListingWireframeInput?

    // MARK: Converting entities
}

 // MARK: VehicleListing module interface

extension VehicleListingPresenter: VehicleListingModuleInterface {

}

// MARK: VehicleListing interactor output interface

extension VehicleListingPresenter: VehicleListingInteractorOutput {
    
}
