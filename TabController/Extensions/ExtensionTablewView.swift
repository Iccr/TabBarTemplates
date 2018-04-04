//
//  ExtensionTablewView.swift
//  Sipradi
//
//  Created by shishir sapkota on 2/27/18.
//  Copyright © 2018 Ekbana. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    func isCellVisible(section:Int, row: Int) -> Bool {
        guard let indexes = self.indexPathsForVisibleRows else {
            return false
        }
        return indexes.contains {$0.section == section && $0.row == row }
    }
}
