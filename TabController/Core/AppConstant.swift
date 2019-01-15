//
//  AppConstant.swift
//  Sipradi
//
//  Created by shishir sapkota on 4/4/18.
//  Copyright © 2018 Ekbana. All rights reserved.
//

import UIKit

struct ApiConstants {
    struct News {
        static let general = "general"
        static let brandTour = "brand-tour"
    }
    
    struct NearBy {
        static let showRooms = "show-room"
        static let petrolPump = "petrol-pump"
        static let resturant = "resturant"
        static let theatre = "threatre"
        static let workshop = "workshop"
        static let emergencyContacts = "emergency-contacts"
        static let batteries = "batteries"
        static let lubricants = "lubricants"
    }
    
    struct Home {
        struct Section {
            static let BANNER = "BANNER"
            static let CATEGORY = "CATEGORY"
            static let TEXT = "TEXT"
            static let CAROUSAL_MEDIUM = "CAROUSAL_MEDIUM"
            static let CAROUSAL_BIG = "CAROUSAL_BIG"
            static let GRID_BIG = "GRID_BIG"
            static let CAROUSAL_SMALL = "CAROUSAL_SMALL"
            static let NEARBY = "NEARBY"
        }

        enum Links: String {
            case url = "URL"
            case module = "MODULE"
            case vehicle = "Vehicle"
            case battery = "Battery"
            case lubricant = "Lubricant"
        }
        
        enum LinkModule: String {
            case pv = "PV"
            case cv = "CV"
            case battery = "BATTERY"
            case lubricant = "LUBRICANT"
            case news = "NEWS"
        }
    }
    
    struct ServicingStatus {
        static let pending = "Pending".lowercased()
        static let inProcess = "In Process".lowercased()
        static let onHold = "On Hold".lowercased()
        static let booking = "Booking".lowercased()
        static let end = "End".lowercased()
    }
}


class AppConstants {
    static let dateFormat = "yyyy-MM-dd"
    static let humanReadableDateFormat = "MMM d, yyyy"
    static let themeRedColor = UIColor.init(hex: "#ed1b24")
    static let themeDarkRedColor = UIColor.init(hex: "#be0007")
    static let themeBlueColor = UIColor.init(hex: "#303e9f") // 2D368F
    static let themWhiteColor = UIColor.init(hex: "#ffffff")
}
