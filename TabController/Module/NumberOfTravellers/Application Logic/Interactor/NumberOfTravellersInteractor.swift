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
    var request: SearchRequestModel?
    var completion: ((SearchRequestModel) -> ())?
    
    // MARK: Initialization
    
    init(service: NumberOfTravellersServiceType, request: SearchRequestModel?) {
        self.service = service
        self.request = request
    }

    // MARK: Converting entities
}

// MARK: NumberOfTravellers interactor input interface

extension NumberOfTravellersInteractor: NumberOfTravellersInteractorInput {
    func viewIsReady() {
        if let request = self.request {
            self.output?.set(request: request)
            
        }
    }
}
