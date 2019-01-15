//
//  ForgotPasswordServiceType.swift
//  GMERemittance
//
//  Created by gme_2 on 11/09/2018.
//Copyright © 2018 Gobal Money Express Co. Ltd. All rights reserved.
//

import Foundation


protocol ForgotPasswordServiceType: class, PasswordResetService {
    
}


protocol PasswordResetService: ApiServiceType {
    func reset(username: String, dob: String, success: @escaping (String) -> (), failure: @escaping (Error) -> ())
}

extension PasswordResetService {
    func reset(username: String, dob: String, success: @escaping (String) -> (), failure: @escaping (Error) -> ()) {
        let url = baseUrl + "mobile/passwordReset"
        let params = ["username": username,"Dob": dob]
        
        auth.request(method: .post, url: url, params: params, needsAuthorization: false, success: { (response: ResponseMessage) in
            if (response.errorCode ?? "") == "1" {
                let error = NSError.init(domain: "Network", code: 0, userInfo: [NSLocalizedDescriptionKey : response.message ?? ""])
                failure(error)
            }else {
                let model = response.message ?? ""
                success(model)
            }
        }) { (error) in
            failure(error)
        }
    }
}



