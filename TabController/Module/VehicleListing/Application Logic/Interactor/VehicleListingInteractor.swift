//
//  VehicleListingInteractor.swift
//  TabController
//
//  Created by gme_2 on 16/01/2019.
//Copyright © 2019 ccr. All rights reserved.
//

import Foundation

class VehicleListingInteractor {
    
	// MARK: Properties
    
    weak var output: VehicleListingInteractorOutput?
    private let service: VehicleListingServiceType
    
    // MARK: Initialization
    
    init(service: VehicleListingServiceType) {
        self.service = service
    }

    // MARK: Converting entities
}

// MARK: VehicleListing interactor input interface

extension VehicleListingInteractor: VehicleListingInteractorInput {
    
}
