//
//  ListingInteractorIO.swift
//  TabController
//
//  Created by gme_2 on 16/01/2019.
//Copyright © 2019 ccr. All rights reserved.
//

protocol ListingInteractorInput: class {
    func viewIsReady()
}

protocol ListingInteractorOutput: class {
    func show(models: [Hotel])
}
