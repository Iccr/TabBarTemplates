//
//  NumberOfTravellersInteractor.swift
//  TabController
//
//  Created by gme_2 on 18/01/2019.
//Copyright © 2019 ccr. All rights reserved.
//

import Foundation

class NumberOfTravellersInteractor {
    
	// MARK: Properties
    
    weak var output: NumberOfTravellersInteractorOutput?
    private let service: NumberOfTravellersServiceType
    
    // MARK: Initialization
    
    init(service: NumberOfTravellersServiceType) {
        self.service = service
    }

    // MARK: Converting entities
}

// MARK: NumberOfTravellers interactor input interface

extension NumberOfTravellersInteractor: NumberOfTravellersInteractorInput {
    
}
