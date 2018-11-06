//
//  ApiServiceType.swift
//  TabController
//
//  Created by gme_2 on 06/11/2018.
//  Copyright © 2018 ccr. All rights reserved.
//

import Foundation


protocol ApiServiceType {
    var auth: Auth {get}
}


extension ApiServiceType {
    var auth: Auth {
        return Auth.shared
    }
}
