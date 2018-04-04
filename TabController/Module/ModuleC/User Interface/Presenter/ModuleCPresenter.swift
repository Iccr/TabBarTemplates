//
//  ModuleCPresenter.swift
//  TabController
//
//  Created by shishir sapkota on 4/4/18.
//Copyright © 2018 ccr. All rights reserved.
//

import Foundation

class ModuleCPresenter {
    
	// MARK: Properties
    
    weak var view: ModuleCViewInterface?
    var interactor: ModuleCInteractorInput?
    var wireframe: ModuleCWireframe?

    // MARK: Converting entities
}

 // MARK: ModuleC module interface

extension ModuleCPresenter: ModuleCModuleInterface {
    
}

// MARK: ModuleC interactor output interface

extension ModuleCPresenter: ModuleCInteractorOutput {
    
}
