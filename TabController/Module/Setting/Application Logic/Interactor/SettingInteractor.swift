//
//  SettingInteractor.swift
//  TabController
//
//  Created by gme_2 on 07/11/2018.
//Copyright © 2018 ccr. All rights reserved.
//

import Foundation

class SettingInteractor {
    
	// MARK: Properties
    
    weak var output: SettingInteractorOutput?
    private let service: SettingServiceType
    
    // MARK: Initialization
    
    init(service: SettingServiceType) {
        self.service = service
    }

    // MARK: Converting entities
}

// MARK: Setting interactor input interface

extension SettingInteractor: SettingInteractorInput {
    
}
