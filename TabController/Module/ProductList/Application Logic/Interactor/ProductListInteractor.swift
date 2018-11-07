//
//  ProductListInteractor.swift
//  TabController
//
//  Created by gme_2 on 07/11/2018.
//Copyright © 2018 ccr. All rights reserved.
//

import Foundation

class ProductListInteractor {
    
	// MARK: Properties
    
    weak var output: ProductListInteractorOutput?
    private let service: ProductListServiceType
    
    // MARK: Initialization
    
    init(service: ProductListServiceType) {
        self.service = service
    }

    // MARK: Converting entities
}

// MARK: ProductList interactor input interface

extension ProductListInteractor: ProductListInteractorInput {
    
}
