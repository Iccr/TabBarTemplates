//
//  LoginViewInterface.swift
//  GMERemittance
//
//  Created by gme_2 on 07/09/2018.
//Copyright © 2018 Gobal Money Express Co. Ltd. All rights reserved.
//

protocol LoginViewInterface: class {
    func show(error: String)
    func showLoading()
    func hideLoading()
}
