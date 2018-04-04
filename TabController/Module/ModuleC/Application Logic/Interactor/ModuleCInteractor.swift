//
//  ModuleCInteractor.swift
//  TabController
//
//  Created by shishir sapkota on 4/4/18.
//Copyright © 2018 ccr. All rights reserved.
//

import Foundation

class ModuleCInteractor {
    
	// MARK: Properties
    
    weak var output: ModuleCInteractorOutput?
    private let service: ModuleCServiceType
    
    // MARK: Initialization
    
    init(service: ModuleCServiceType) {
        self.service = service
    }

    // MARK: Converting entities
}

// MARK: ModuleC interactor input interface

extension ModuleCInteractor: ModuleCInteractorInput {
    
}
