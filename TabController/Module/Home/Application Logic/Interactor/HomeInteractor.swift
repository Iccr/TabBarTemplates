//
//  HomeInteractor.swift
//  TabController
//
//  Created by gme_2 on 15/01/2019.
//Copyright © 2019 ccr. All rights reserved.
//

import Foundation

class HomeInteractor {
    
	// MARK: Properties
    
    weak var output: HomeInteractorOutput?
    private let service: HomeServiceType
    
    // MARK: Initialization
    
    init(service: HomeServiceType) {
        self.service = service
    }

    // MARK: Converting entities
}

// MARK: Home interactor input interface

extension HomeInteractor: HomeInteractorInput {
    
}
