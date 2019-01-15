//
//  LoginService.swift
//  GMERemittance
//
//  Created by gme_2 on 07/09/2018.
//Copyright © 2018 Gobal Money Express Co. Ltd. All rights reserved.
//

import Foundation

class LoginService: LoginServiceType {
    
    // MARK: Properties
    
    // MARK: Initialization
    
    // MARK: Data management
}


protocol LoginApiService: ApiServiceType {
    func _login(userId: String, password: String ,success: @escaping (User?) -> (), failure: @escaping (Error) -> ())
}

extension LoginApiService {
    func _login(userId: String, password: String, success: @escaping (User?) -> (), failure: @escaping (Error) -> ()) {
        let params = [ "userId": userId,    "password": password ]
        let url = baseUrl + "users/access-code"
        auth.request(method: .post, url: url, params: params,needsAuthorization: false,  success: { (response: UserContainer ) in
            if (response.errorCode ?? "") == "1" {
                let error = NSError.init(domain: "Network", code: 0, userInfo: [NSLocalizedDescriptionKey : response.message ?? ""])
                failure(error)
            }else {
                let model = response.data
                success(model)
            }
        }) { (error) in
            failure(error)
        }
    }
}
