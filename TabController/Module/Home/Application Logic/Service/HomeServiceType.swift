//
//  HomeServiceType.swift
//  TabController
//
//  Created by gme_2 on 15/01/2019.
//Copyright © 2019 ccr. All rights reserved.
//

import Foundation
import Alamofire

protocol HomeServiceType: class, VehicleSearchService {
    
}


protocol VehicleSearchService: ApiServiceType {
    func search(request: SearchRequestModel,  success: @escaping ([Vehicle]) -> (), failure: @escaping (Error) -> ())
}

extension VehicleSearchService {
    func search(request: SearchRequestModel,  success: @escaping ([Vehicle]) -> (), failure: @escaping (Error) -> ()) {
        let params = request.serialize()
        let url = baseUrl + "blabvla/bla"
        auth.request(method: .get, url: url, params: params, success: { (response: SearchContainer) in
            let models = response.data ?? []
            success(models)
        }) { (error) in
            failure(error)
        }
    }
}
