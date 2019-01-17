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
    func search(request: SearchRequestModel,  success: @escaping ([Hotel]) -> (), failure: @escaping (Error) -> ())
}

extension VehicleSearchService {
    func search(request: SearchRequestModel,  success: @escaping ([Hotel]) -> (), failure: @escaping (Error) -> ()) {
        let model1 = Hotel()
        model1.images = ["blaba", "blbla", "blala", "bla", "bla"]
        
        let model2 = Hotel()
        model2.images = ["blaba", "blbla", "blala", "bla", "bla"]
        
        let model3 = Hotel()
        model3.images = ["blaba", "blbla", "blala", "bla", "bla"]
        
        success([model1, model2, model3])
        return
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
