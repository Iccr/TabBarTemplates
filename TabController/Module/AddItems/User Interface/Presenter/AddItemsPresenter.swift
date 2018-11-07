//
//  AddItemsPresenter.swift
//  TabController
//
//  Created by gme_2 on 07/11/2018.
//Copyright © 2018 ccr. All rights reserved.
//

import Foundation

class AddItemsPresenter {
    
	// MARK: Properties
    
    weak var view: AddItemsViewInterface?
    var interactor: AddItemsInteractorInput?
    var wireframe: AddItemsWireframeInput?

    // MARK: Converting entities
}

 // MARK: AddItems module interface

extension AddItemsPresenter: AddItemsModuleInterface {

}

// MARK: AddItems interactor output interface

extension AddItemsPresenter: AddItemsInteractorOutput {
    
}
