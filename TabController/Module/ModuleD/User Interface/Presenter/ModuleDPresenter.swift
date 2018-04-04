//
//  ModuleDPresenter.swift
//  TabController
//
//  Created by shishir sapkota on 4/4/18.
//Copyright © 2018 ccr. All rights reserved.
//

import Foundation

class ModuleDPresenter {
    
	// MARK: Properties
    
    weak var view: ModuleDViewInterface?
    var interactor: ModuleDInteractorInput?
    var wireframe: ModuleDWireframe?

    // MARK: Converting entities
}

 // MARK: ModuleD module interface

extension ModuleDPresenter: ModuleDModuleInterface {
    
}

// MARK: ModuleD interactor output interface

extension ModuleDPresenter: ModuleDInteractorOutput {
    
}
