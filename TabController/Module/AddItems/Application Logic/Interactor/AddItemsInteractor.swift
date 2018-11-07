//
//  AddItemsInteractor.swift
//  TabController
//
//  Created by gme_2 on 07/11/2018.
//Copyright © 2018 ccr. All rights reserved.
//

import Foundation

class AddItemsInteractor {
    
	// MARK: Properties
    
    weak var output: AddItemsInteractorOutput?
    private let service: AddItemsServiceType
    
    // MARK: Initialization
    
    init(service: AddItemsServiceType) {
        self.service = service
    }

    // MARK: Converting entities
}

// MARK: AddItems interactor input interface

extension AddItemsInteractor: AddItemsInteractorInput {
    
}
