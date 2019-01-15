//
//  RegisterServiceType.swift
//  GMERemittance
//
//  Created by gme_2 on 10/09/2018.
//Copyright © 2018 Gobal Money Express Co. Ltd. All rights reserved.
//

import Foundation
import Alamofire

protocol RegisterServiceType: class, RegisterUserService {
    
}



protocol RegisterUserService: ApiServiceType {
    func register(params: [String: String], success: @escaping (String?) -> (), failure: @escaping (Error) -> ())
}

extension RegisterUserService {
    func register(params: [String: String], success: @escaping (String?) -> (), failure: @escaping (Error) -> ()) {
        let url = baseUrl + "mobile/customerRegister"
        auth.request(method: .post, url: url, params: params, needsAuthorization: false,  success: { (response: ResponseMessage) in
            if (response.errorCode ?? "") == "1" {
                let error = NSError.init(domain: "Network", code: 0, userInfo: [NSLocalizedDescriptionKey : response.message ?? ""])
                failure(error)
            }else {
                success(response.message)
            }
        }) { (error) in
            failure(error)
        }
    }
}


