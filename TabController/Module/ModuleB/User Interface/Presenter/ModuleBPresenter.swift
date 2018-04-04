//
//  ModuleBPresenter.swift
//  TabController
//
//  Created by shishir sapkota on 4/4/18.
//Copyright © 2018 ccr. All rights reserved.
//

import Foundation

class ModuleBPresenter {
    
	// MARK: Properties
    
    weak var view: ModuleBViewInterface?
    var interactor: ModuleBInteractorInput?
    var wireframe: ModuleBWireframe?

    // MARK: Converting entities
}

 // MARK: ModuleB module interface

extension ModuleBPresenter: ModuleBModuleInterface {
    
}

// MARK: ModuleB interactor output interface

extension ModuleBPresenter: ModuleBInteractorOutput {
    
}
