//
//  RegisterInteractor.swift
//  GMERemittance
//
//  Created by gme_2 on 10/09/2018.
//Copyright © 2018 Gobal Money Express Co. Ltd. All rights reserved.
//

import Foundation
import FirebaseInstanceID

class RegisterInteractor {
    
	// MARK: Properties
    
    weak var output: RegisterInteractorOutput?
    private let service: RegisterServiceType
    
    // MARK: Initialization
    
    init(service: RegisterServiceType) {
        self.service = service
    }

    private func isValidPasword(password: String, confirmPassword: String) -> (isValid: Bool, error: String) {
        var error = ""
        var isValid = true
        
        // >= 9, 1 special character, 1 number
        
        func isValidLength() -> Bool {
            return password.count >= 9
        }
        
        func hasNumber() -> Bool {
            let characterSet =  CharacterSet.init(charactersIn: "1234567890")
            return password.rangeOfCharacter(from: characterSet) != nil
        }
        
        func hasLetter() -> Bool {
            let characterSet =  CharacterSet.letters
            return password.rangeOfCharacter(from: characterSet) != nil
        }
        
        func hasSpecialCharacter() -> Bool {
            let characterSet = CharacterSet.alphanumerics
            return password.rangeOfCharacter(from: characterSet.inverted) != nil
        }
        
        func hasUpperCase() -> Bool {
            let characterSet = CharacterSet.uppercaseLetters
            return password.rangeOfCharacter(from: characterSet) != nil
        }
     
        
        if password.isEmpty {
            error = error + "\n Password cannot be empty"
            isValid = false
        }else {
            
            if !isValidLength() {
                error = error + "\n Password should have at least 9 characters"
                isValid = false
                return (isValid, error)
            }
            
            let validPassword = hasNumber() && hasLetter() && hasSpecialCharacter() && hasUpperCase()
            
            if !validPassword {
                isValid = false
                error = error + "\n Password should contain at least one symbol, one capital letter and one number"
                return (isValid, error)
            }
            
            if password != confirmPassword {
                error = error + "\n Passwords does not match."
                isValid = false
            }
        }
        
        return (isValid, error)
    }
    // MARK: Converting entities
    
    private func isValid(userName: String, password: String, confirmPassword: String, dob: String) -> (isValid: Bool, error: Error) {
        var error = ""
        var isValid = true
        // user name
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
        
        let result = self.isValidPasword(password: password, confirmPassword: confirmPassword)
        
        if !result.isValid {
            error = error + result.error
            isValid = false
        }
        
        if dob.isEmpty {
            error = error + "\n Please enter a valid date of birth"
            isValid = false
        }
        
        let _error = NSError.init(domain: "LoginInteractor", code: 0, userInfo: [NSLocalizedDescriptionKey : error])
        return (isValid, _error)
    }
    
    
    private func getFcmToken() -> String? {
        let token = InstanceID.instanceID().token()
        return token
    }
    

}


extension RegisterInteractor: RegisterInteractorInput {
    func register(model: RegisterRequestModel) {
        let validationResult = self.isValid(userName: model.username ?? "", password: model.password ?? "", confirmPassword: model.confirmPassword ?? "", dob: model.dob ?? "")
        if !validationResult.isValid {
            self.output?.show(error: validationResult.error)
            return
        }
        
        model.uuid = Utility.getUUid()
        model.appVersion = Utility.getAppVersion()
        model.phoneBrand = Utility.getPhoneBrand()
        model.phoneOs = Utility.getPhoneOs()
        model.osVersion = Utility.getOsVersion()
        model.fcmId = self.getFcmToken()
        model.clientId = Utility.getCliendId()
        
        self.service.register(params: model.serialize(), success: { (message) in
            self.output?.success(message: message ?? "")
        }) { (error) in
            self.output?.show(error: error)
        }
        
    }
}
