//
//  LoginInteractorIO.swift
//  GMERemittance
//
//  Created by gme_2 on 07/09/2018.
//Copyright © 2018 Gobal Money Express Co. Ltd. All rights reserved.
//

protocol LoginInteractorInput: class {
    func login(username: String, password: String)
}

protocol LoginInteractorOutput: class {
    func show(error: Error)
    func loggedIn()
}
