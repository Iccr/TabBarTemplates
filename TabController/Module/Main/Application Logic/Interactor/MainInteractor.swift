//
//  MainInteractor.swift
//  TabController
//
//  Created by shishir sapkota on 4/4/18.
//Copyright © 2018 ccr. All rights reserved.
//

import Foundation

class MainInteractor: MainInteractorInput {
    
	// MARK: Properties
    
    weak var output: MainInteractorOutput?
    private let service: MainServiceType
    
    // MARK: Initialization
    
    init(service: MainServiceType) {
        self.service = service
    }

    // MARK: Main interactor input interface

    // MARK: Converting entities
}
