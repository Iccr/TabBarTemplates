//
//  ModuleDInteractor.swift
//  TabController
//
//  Created by shishir sapkota on 4/4/18.
//Copyright © 2018 ccr. All rights reserved.
//

import Foundation

class ModuleDInteractor {
    
	// MARK: Properties
    
    weak var output: ModuleDInteractorOutput?
    private let service: ModuleDServiceType
    
    // MARK: Initialization
    
    init(service: ModuleDServiceType) {
        self.service = service
    }

    // MARK: Converting entities
}

// MARK: ModuleD interactor input interface

extension ModuleDInteractor: ModuleDInteractorInput {
    
}
