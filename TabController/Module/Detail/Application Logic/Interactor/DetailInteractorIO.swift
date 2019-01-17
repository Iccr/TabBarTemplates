//
//  DetailInteractorIO.swift
//  TabController
//
//  Created by shishir sapkota on 1/16/19.
//Copyright © 2019 ccr. All rights reserved.
//

protocol DetailInteractorInput: class {
    func viewIsReady()
}

protocol DetailInteractorOutput: class {
    func show(model: Hotel)
    func show(error: Error)
}
