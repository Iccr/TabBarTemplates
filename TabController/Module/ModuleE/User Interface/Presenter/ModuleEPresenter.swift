//
//  ModuleEPresenter.swift
//  TabController
//
//  Created by shishir sapkota on 4/4/18.
//Copyright © 2018 ccr. All rights reserved.
//

import Foundation

class ModuleEPresenter {
    
	// MARK: Properties
    
    weak var view: ModuleEViewInterface?
    var interactor: ModuleEInteractorInput?
    var wireframe: ModuleEWireframe?

    // MARK: Converting entities
}

 // MARK: ModuleE module interface

extension ModuleEPresenter: ModuleEModuleInterface {
    
}

// MARK: ModuleE interactor output interface

extension ModuleEPresenter: ModuleEInteractorOutput {
    
}
