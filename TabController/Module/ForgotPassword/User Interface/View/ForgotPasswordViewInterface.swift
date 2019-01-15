//
//  ForgotPasswordViewInterface.swift
//  GMERemittance
//
//  Created by gme_2 on 11/09/2018.
//Copyright © 2018 Gobal Money Express Co. Ltd. All rights reserved.
//

protocol ForgotPasswordViewInterface: class {
    func show(message: String)
    func show(error: String)
    func showLoading()
    func hideLoading()
}
