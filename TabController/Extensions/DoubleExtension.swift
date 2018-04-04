//
//  DoubleExtension.swift
//  TabController
//
//  Created by shishir sapkota on 4/4/18.
//Copyright © 2018 ccr. All rights reserved.
//


import Foundation

extension Double {
    
    
    mutating func roundOff(precision: Double) -> Double {
        let multiplier = pow(10.0, precision)
        let y = Double(Darwin.round(multiplier * self)/multiplier)  // round function takes decimal value and returns double without decimals. round(123.456) --> 123
        return y
    }
    
    
    var inLac: String {
        let inLac = self/100000
        return inLac.twoDecimalMaxString
    }
    
    var formattedMileage: String {
        return twoDecimalMaxString
    }
    
    var formattedCapacity: String {
        return twoDecimalMaxString
    }
    
    var twoDecimalMaxString: String {
        return formatter().string(from: NSNumber(value: self)) ?? ""
    }
    
    private func formatter() -> NumberFormatter {
        let numberFormatter = NumberFormatter()
        numberFormatter.maximumFractionDigits = 2
        numberFormatter.minimumFractionDigits = 0
        return numberFormatter
    }
}

// show 390001 -> 3.9 L

extension Double {
    func representInLakh() -> String {
        let temp = Double(self / 100000)
        if temp > 1.0 {
        return temp != 0 ? "\(temp.twoDecimalMaxString) L" : "\(self)"
        }
        return self.description
    }
}

