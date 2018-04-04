//
//  LoadingInteractor.swift
//  TabController
//
//  Created by shishir sapkota on 4/4/18.
//Copyright © 2018 ccr. All rights reserved.
//

import Foundation

class LoadingInteractor {
    
	// MARK: Properties
    
    weak var output: LoadingInteractorOutput?
    private let service: LoadingServiceType
    
    // MARK: Initialization
    
    init(service: LoadingServiceType) {
        self.service = service
    }

    // MARK: Converting entities
}

// MARK: Loading interactor input interface

extension LoadingInteractor: LoadingInteractorInput {
    
}
