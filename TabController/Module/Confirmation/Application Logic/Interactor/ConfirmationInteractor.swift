//
//  ConfirmationInteractor.swift
//  TabController
//
//  Created by gme_2 on 17/01/2019.
//Copyright © 2019 ccr. All rights reserved.
//

import Foundation

class ConfirmationInteractor {
    
	// MARK: Properties
    var model: Hotel?
    var request: SearchRequestModel?
    
    weak var output: ConfirmationInteractorOutput?
    private let service: ConfirmationServiceType
    
    // MARK: Initialization
    
    init(service: ConfirmationServiceType, model: Hotel?, request: SearchRequestModel?) {
        self.service = service
        self.model = model
        self.request = request
    }

    // MARK: Converting entities
}

// MARK: Confirmation interactor input interface

extension ConfirmationInteractor: ConfirmationInteractorInput {
    func viewIsReady() {
        guard let model = self.model, let request = self.request else {
            return
        }
        self.output?.show(model: model, request: request)
    }
}
