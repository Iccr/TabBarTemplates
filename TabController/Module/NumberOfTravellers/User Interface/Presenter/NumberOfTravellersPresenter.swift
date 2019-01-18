//
//  NumberOfTravellersPresenter.swift
//  TabController
//
//  Created by gme_2 on 18/01/2019.
//Copyright © 2019 ccr. All rights reserved.
//

import Foundation

class NumberOfTravellersPresenter {
    
	// MARK: Properties
    
    weak var view: NumberOfTravellersViewInterface?
    var interactor: NumberOfTravellersInteractorInput?
    var wireframe: NumberOfTravellersWireframeInput?

    // MARK: Converting entities
}

 // MARK: NumberOfTravellers module interface

extension NumberOfTravellersPresenter: NumberOfTravellersModuleInterface {

}

// MARK: NumberOfTravellers interactor output interface

extension NumberOfTravellersPresenter: NumberOfTravellersInteractorOutput {
    
}
