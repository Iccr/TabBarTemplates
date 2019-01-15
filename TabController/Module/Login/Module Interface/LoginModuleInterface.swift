//
//  LoginModuleInterface.swift
//  GMERemittance
//
//  Created by gme_2 on 07/09/2018.
//Copyright © 2018 Gobal Money Express Co. Ltd. All rights reserved.
//

protocol LoginModuleInterface: class {
    func login(userName: String, password: String)
    func register()
    func forgotPassword()
}
