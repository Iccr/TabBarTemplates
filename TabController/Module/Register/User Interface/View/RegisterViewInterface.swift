//
//  RegisterViewInterface.swift
//  GMERemittance
//
//  Created by gme_2 on 10/09/2018.
//Copyright © 2018 Gobal Money Express Co. Ltd. All rights reserved.
//

protocol RegisterViewInterface: class {
    func showLoading()
    func hideLoading()
    func show(error: String)
    func show(message: String)
}
