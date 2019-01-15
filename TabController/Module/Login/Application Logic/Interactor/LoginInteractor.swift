//
//  LoginInteractor.swift
//  GMERemittance
//
//  Created by gme_2 on 07/09/2018.
//Copyright © 2018 Gobal Money Express Co. Ltd. All rights reserved.
//

import Foundation

class LoginInteractor {
    
	// MARK: Properties
    
    weak var output: LoginInteractorOutput?
    private let service: LoginServiceType
    
    // MARK: Initialization
    
    init(service: LoginServiceType) {
        self.service = service
    }


    
    func toBase64(text: String) -> String? {
        guard let data = text.data(using: String.Encoding.utf8) else {
            return nil
        }
        
        return data.base64EncodedString(options: Data.Base64EncodingOptions(rawValue: 0))
    }
    
    private func isValid(userName: String, password: String) -> (isValid: Bool, error: Error){
        var error = ""
        var isValid = true
        if userName.isEmpty {
            error = error + "Username field is required.";
            isValid = false
        }
        
        if password.isEmpty {error = error + "\n Password filed is required.";
            isValid = false
        }
        let _error = NSError.init(domain: "LoginInteractor", code: 0, userInfo: [NSLocalizedDescriptionKey : error])
        return (isValid, _error)
    }

    // MARK: Converting entities
}

// MARK: Login interactor input interface

extension LoginInteractor: LoginInteractorInput {
    func login(username: String, password: String) {
        
        let validationResult = self.isValid(userName: username, password: password)
        if !validationResult.isValid {
            self.output?.show(error: validationResult.error)
            return
        }
        guard let passwordBase64Data = self.toBase64(text: password) else {
            return
            
        }
        print("password converted is")
        print(passwordBase64Data)
        self.service._login(userId: username, password: password, success: { (user) in

            let accessCode = user?.accessCode ?? ""
            let accessCodeBase64 = accessCode
//            Utility.save(user: user, accessCodeBase64: accessCodeBase64, password: password, login: true)
            
          self.output?.loggedIn()
            
        }) { (error) in
            self.output?.show(error: error)
        }
    }
}
