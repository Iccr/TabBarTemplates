//
//  Either.swift
//  TabController
//
//  Created by shishir sapkota on 4/4/18.
//Copyright © 2018 ccr. All rights reserved.
//


import Foundation

enum Either<T, U> {
    case this(T), that(U)
}
