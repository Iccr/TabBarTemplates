//
//  CollectionExtension.swift
//  Sipradi
//
//  Created by Dari on 6/14/17.
//  Copyright © 2017 Ekbana. All rights reserved.
//

import Foundation



extension Array {
    func elementAt(index: Int) -> Array.Iterator.Element? {
        if index < self.count && index >= 0 {
            return self[index]
        }
        return nil
    }
}
