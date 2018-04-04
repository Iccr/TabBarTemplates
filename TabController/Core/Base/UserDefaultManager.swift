        //
//  EulaAgreementService.swift
//  TabController
//
//  Created by shishir sapkota on 4/4/18.
//Copyright © 2018 ccr. All rights reserved.
//

import Foundation

        
protocol LoginDataManagerInterface: class {
    func save(value: Any, forKey key: String)
    func getValue(forKey key: String) -> String?
}

class UserDefaultManager {
    
    // MARK: Properties
    private let userDefault = UserDefaults.standard
    
}

extension UserDefaultManager {
    // MARK: Data Manager Interface
    func save(value: Any, forKey key: String) {
        userDefault.set(value, forKey: key)
    }
    
    func getValue<T>(forKey key: String) -> T? {
        return userDefault.value(forKey: key) as? T
    }
}

extension UserDefaultManager: LoginDataManagerInterface {
    
}

        


