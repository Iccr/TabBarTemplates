//
//  HomeInteractorIO.swift
//  TabController
//
//  Created by gme_2 on 15/01/2019.
//Copyright © 2019 ccr. All rights reserved.
//

protocol HomeInteractorInput: class {
    func search(request: SearchRequestModel)
}

protocol HomeInteractorOutput: class {
    func show(models: [Vehicle])
    func show(error: Error)
}
