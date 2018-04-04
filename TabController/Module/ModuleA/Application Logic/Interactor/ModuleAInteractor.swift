//
//  ModuleAInteractor.swift
//  TabController
//
//  Created by shishir sapkota on 4/4/18.
//Copyright © 2018 ccr. All rights reserved.
//

import Foundation

class ModuleAInteractor {
    
	// MARK: Properties
    
    weak var output: ModuleAInteractorOutput?
    private let service: ModuleAServiceType
    
    // MARK: Initialization
    
    init(service: ModuleAServiceType) {
        self.service = service
    }

    // MARK: Converting entities
}

// MARK: ModuleA interactor input interface

extension ModuleAInteractor: ModuleAInteractorInput {
    
}
