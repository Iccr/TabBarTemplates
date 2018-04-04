//
//  SequenceExtension.swift
//  Sipradi
//
//  Created by shishir sapkota on 1/31/18.
//  Copyright © 2018 Ekbana. All rights reserved.
//

import Foundation

public extension Sequence {
    func group<U: Hashable>(by key: (Iterator.Element) -> U) -> [U:[Iterator.Element]] {
        var categories: [U: [Iterator.Element]] = [:]
        for element in self {
            let key = key(element)
            if case nil = categories[key]?.append(element) {
                categories[key] = [element]
            }
        }
        return categories
    }
}
