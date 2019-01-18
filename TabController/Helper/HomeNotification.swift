//
//  HomeNotification.swift
//  TabController
//
//  Created by gme_2 on 18/01/2019.
//  Copyright © 2019 ccr. All rights reserved.
//

import Foundation




struct HomeNotification {
    static func getDirectionSelection() -> Notification.Name {
        let name = "getDirectionSelection"
        return Notification.Name.init(name)
    }
    
    static func getPassengerNumberSelection() -> Notification.Name {
        let name = "getPassengerNumberSelection"
        return Notification.Name.init(name)
    }
}
