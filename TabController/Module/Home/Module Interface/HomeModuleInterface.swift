//
//  HomeModuleInterface.swift
//  TabController
//
//  Created by gme_2 on 15/01/2019.
//Copyright © 2019 ccr. All rights reserved.
//

protocol HomeModuleInterface: class {
    func search(request: SearchRequestModel)
    func openNumberOfTravellerSelection(request: SearchRequestModel?, completion: @escaping (SearchRequestModel) -> ())
}
