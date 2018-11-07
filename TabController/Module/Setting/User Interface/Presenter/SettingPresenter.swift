//
//  SettingPresenter.swift
//  TabController
//
//  Created by gme_2 on 07/11/2018.
//Copyright © 2018 ccr. All rights reserved.
//

import Foundation

class SettingPresenter {
    
	// MARK: Properties
    
    weak var view: SettingViewInterface?
    var interactor: SettingInteractorInput?
    var wireframe: SettingWireframeInput?

    // MARK: Converting entities
}

 // MARK: Setting module interface

extension SettingPresenter: SettingModuleInterface {

}

// MARK: Setting interactor output interface

extension SettingPresenter: SettingInteractorOutput {
    
}
