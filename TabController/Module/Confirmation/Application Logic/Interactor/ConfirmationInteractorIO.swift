//
//  ConfirmationInteractorIO.swift
//  TabController
//
//  Created by gme_2 on 17/01/2019.
//Copyright © 2019 ccr. All rights reserved.
//

protocol ConfirmationInteractorInput: class {
    func viewIsReady()
}

protocol ConfirmationInteractorOutput: class {
    func show(model: Hotel, request: SearchRequestModel)
    
}
