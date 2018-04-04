//
//  Utilities.swift
//  TabController
//
//  Created by shishir sapkota on 4/4/18.
//Copyright © 2018 ccr. All rights reserved.
//

import Foundation
import UIKit

var loggerEnabled: Bool = true

func logger(_ items: Any...) {
    if loggerEnabled {
        print(items)
    }
}



func getQueryParams(urlString:String)->String {
    let paramString = urlString.components(separatedBy: "?")
    if (paramString.count == 0 || paramString.count < 2) {
        return ""
    }
    else {
        let paramId = paramString[1]
        return paramId.components(separatedBy: "=")[1]
    }
}
