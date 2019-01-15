//
//  ForgotPasswordModuleInterface.swift
//  GMERemittance
//
//  Created by gme_2 on 11/09/2018.
//Copyright © 2018 Gobal Money Express Co. Ltd. All rights reserved.
//

protocol ForgotPasswordModuleInterface: class {
    func reset(username: String, dob: String)
    func cancel()
}
