//
//  TableModel.swift
//  Aertrip_Assignment
//
//  Created by Amsys on 10/03/20.
//  Copyright © 2020 SivaKumarAketi. All rights reserved.
//

import Foundation

//Model for table view
struct TableModel {
    var items: [String]!
    var collapsed: Bool!
    
    init(items: [String], collapsed: Bool = false) {
        self.items = items
        self.collapsed = collapsed
    }
}
