//
//  SplashScreenInteractor.swift
//  GMERemittance
//
//  Created by gme_2 on 10/09/2018.
//Copyright © 2018 Gobal Money Express Co. Ltd. All rights reserved.
//

import Foundation

class SplashScreenInteractor {
    
	// MARK: Properties
    
    weak var output: SplashScreenInteractorOutput?
    private let service: SplashScreenServiceType
    
    // MARK: Initialization
    
    init(service: SplashScreenServiceType) {
        self.service = service
    }

    // MARK: Converting entities
}

// MARK: SplashScreen interactor input interface

extension SplashScreenInteractor: SplashScreenInteractorInput {
    
}
