//
//  NumberOfTravellersInteractorIO.swift
//  TabController
//
//  Created by gme_2 on 18/01/2019.
//Copyright © 2019 ccr. All rights reserved.
//

protocol NumberOfTravellersInteractorInput: class {
    func viewIsReady()
}

protocol NumberOfTravellersInteractorOutput: class {
    func set(request: SearchRequestModel)
}
