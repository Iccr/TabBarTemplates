//
//  StringExtension.swift
//  TabController
//
//  Created by shishir sapkota on 4/4/18.
//Copyright © 2018 ccr. All rights reserved.
//


import Foundation

extension String {
    func capitalizingFirstLetter() -> String {
        let first = String(characters.prefix(1)).capitalized
        let other = String(characters.dropFirst())
        return first + other
    }
    
    func url() -> URL? {
        
        if !self.isEmpty {
            return URL(string: self.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!)
        }else {
            return nil
        }
    }
}



