//
//  DetailWireframeInput.swift
//  TabController
//
//  Created by shishir sapkota on 1/16/19.
//Copyright © 2019 ccr. All rights reserved.
//

import Foundation

protocol DetailWireframeInput: WireframeInput {
     func openConfirmation(for hotel: Hotel, and request: SearchRequestModel?)
}
