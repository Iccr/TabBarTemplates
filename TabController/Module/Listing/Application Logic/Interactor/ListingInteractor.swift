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
    var models: [Hotel]?
    var request: SearchRequestModel?
    
    weak var output: ListingInteractorOutput?
    private let service: ListingServiceType
    
    // MARK: Initialization
    
    init(service: ListingServiceType, models: [Hotel]?, and request: SearchRequestModel?) {
        self.service = service
        self.models = models
        self.request = request
    }

    // MARK: Converting entities
}

// MARK: Listing interactor input interface

extension ListingInteractor: ListingInteractorInput {
    func viewIsReady() {
        self.output?.show(models: self.models ?? [])
        if let request  = self.request {
            self.output?.show(request: request)
        }
        
    }
}
