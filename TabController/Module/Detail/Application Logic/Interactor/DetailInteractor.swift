//
//  DetailInteractor.swift
//  TabController
//
//  Created by shishir sapkota on 1/16/19.
//Copyright © 2019 ccr. All rights reserved.
//

import Foundation

class DetailInteractor {
    
	// MARK: Properties
    
    weak var output: DetailInteractorOutput?
    private let service: DetailServiceType
    var model: Hotel?
    
    // MARK: Initialization
    
    init(service: DetailServiceType, model: Hotel?) {
        self.service = service
        self.model = model
    }

    // MARK: Converting entities
}

// MARK: Detail interactor input interface

extension DetailInteractor: DetailInteractorInput {
    func viewIsReady() {
        guard let model = self.model else { raiseError(message: "Cannot find hotel Detail"); return}
        self.output?.show(model: model)
    }
    
    func raiseError(message: String) {
        let error = NSError.init(domain: "DetailInteractor", code: 0, userInfo: [NSLocalizedDescriptionKey : message])
        self.output?.show(error: error)
    }
}