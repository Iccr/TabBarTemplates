//
//  ListingInteractor.swift
//  TabController
//
//  Created by gme_2 on 16/01/2019.
//Copyright © 2019 ccr. All rights reserved.
//

import Foundation

class ListingInteractor {
    
	// MARK: Properties
    var models: [Vehicle]?
    
    weak var output: ListingInteractorOutput?
    private let service: ListingServiceType
    
    // MARK: Initialization
    
    init(service: ListingServiceType, models: [Vehicle]?) {
        self.service = service
        self.models = models
    }

    // MARK: Converting entities
}

// MARK: Listing interactor input interface

extension ListingInteractor: ListingInteractorInput {
    func viewIsReady() {
        self.output?.show(models: self.models ?? [])
    }
}
