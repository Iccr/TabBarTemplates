//
//  ModuleAPresenter.swift
//  TabController
//
//  Created by shishir sapkota on 4/4/18.
//Copyright © 2018 ccr. All rights reserved.
//

import Foundation

class ModuleAPresenter {
    
	// MARK: Properties
    
    weak var view: ModuleAViewInterface?
    var interactor: ModuleAInteractorInput?
    var wireframe: ModuleAWireframe?

    // MARK: Converting entities
}

 // MARK: ModuleA module interface

extension ModuleAPresenter: ModuleAModuleInterface {
    
}

// MARK: ModuleA interactor output interface

extension ModuleAPresenter: ModuleAInteractorOutput {
    
}
