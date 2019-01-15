//
//  ForgotPasswordInteractor.swift
//  GMERemittance
//
//  Created by gme_2 on 11/09/2018.
//Copyright © 2018 Gobal Money Express Co. Ltd. All rights reserved.
//

import Foundation

class ForgotPasswordInteractor {
    
	// MARK: Properties
    
    weak var output: ForgotPasswordInteractorOutput?
    private let service: ForgotPasswordServiceType
    
    // MARK: Initialization
    
    init(service: ForgotPasswordServiceType) {
        self.service = service
    }

    
    private func isValid(userName: String, dob: String) -> (isValid: Bool, error: Error){
        var error = ""
        var isValid = true
        if userName.contains("@") {
            if !Utility.isValidEmail(email: userName) {error = error + "Please enter a valid email id"
                isValid = false
            }
        }else {
            isValid = true
            if ( userName.rangeOfCharacter(from: NSCharacterSet.letters) != nil)  {
                error = error + "Please enter a valid email id"
                isValid = false
            }
        }
        
        if userName.isEmpty {
            error = error + "Please enter a valid email id";
            isValid = false
        }
        let _error = NSError.init(domain: "ForgotPasswordInteractor", code: 0, userInfo: [NSLocalizedDescriptionKey : error])
        return (isValid, _error)
    }

    // MARK: Converting entities
}

// MARK: ForgotPassword interactor input interface

extension ForgotPasswordInteractor: ForgotPasswordInteractorInput {
    func reset(username: String, dob: String) {
        let result =  self.isValid(userName: username, dob: dob)
        if !result.isValid {
            self.output?.show(error: result.error)
            return
        }
        self.service.reset(username: username, dob: dob, success: { (message) in
            self.output?.show(message: message)
        }) { (error) in
            self.output?.show(error: error)
        }
    }
}
