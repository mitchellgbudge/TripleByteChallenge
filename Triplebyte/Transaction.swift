//
//  Transaction.swift
//  Triplebyte
//
//  Created by Mitchell Budge on 10/9/19.
//  Copyright © 2019 Mitchell Budge. All rights reserved.
//

import Foundation

struct Transaction {
    
    let location: String
    let date: Date = Date()
    let amount: Double
    let category: SpendingCategory
}

enum SpendingCategory {
    case food
    case groceries
    case transportation
}
