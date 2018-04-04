//
//  ModuleEInteractor.swift
//  TabController
//
//  Created by shishir sapkota on 4/4/18.
//Copyright © 2018 ccr. All rights reserved.
//

import Foundation

class ModuleEInteractor {
    
	// MARK: Properties
    
    weak var output: ModuleEInteractorOutput?
    private let service: ModuleEServiceType
    
    // MARK: Initialization
    
    init(service: ModuleEServiceType) {
        self.service = service
    }

    // MARK: Converting entities
}

// MARK: ModuleE interactor input interface

extension ModuleEInteractor: ModuleEInteractorInput {
    
}
