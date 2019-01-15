//
//  RegisterInteractorIO.swift
//  GMERemittance
//
//  Created by gme_2 on 10/09/2018.
//Copyright © 2018 Gobal Money Express Co. Ltd. All rights reserved.
//

protocol RegisterInteractorInput: class {
    func register(model: RegisterRequestModel)
}

protocol RegisterInteractorOutput: class {
    func show(error: Error)
    func success(message: String)
}
