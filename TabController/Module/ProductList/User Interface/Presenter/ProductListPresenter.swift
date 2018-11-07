//
//  ProductListPresenter.swift
//  TabController
//
//  Created by gme_2 on 07/11/2018.
//Copyright © 2018 ccr. All rights reserved.
//

import Foundation

class ProductListPresenter {
    
	// MARK: Properties
    
    weak var view: ProductListViewInterface?
    var interactor: ProductListInteractorInput?
    var wireframe: ProductListWireframeInput?

    // MARK: Converting entities
}

 // MARK: ProductList module interface

extension ProductListPresenter: ProductListModuleInterface {

}

// MARK: ProductList interactor output interface

extension ProductListPresenter: ProductListInteractorOutput {
    
}
