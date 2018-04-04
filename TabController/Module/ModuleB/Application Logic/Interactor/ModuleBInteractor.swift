//
//  ModuleBInteractor.swift
//  TabController
//
//  Created by shishir sapkota on 4/4/18.
//Copyright © 2018 ccr. All rights reserved.
//

import Foundation

class ModuleBInteractor {
    
	// MARK: Properties
    
    weak var output: ModuleBInteractorOutput?
    private let service: ModuleBServiceType
    
    // MARK: Initialization
    
    init(service: ModuleBServiceType) {
        self.service = service
    }

    // MARK: Converting entities
}

// MARK: ModuleB interactor input interface

extension ModuleBInteractor: ModuleBInteractorInput {
    
}
