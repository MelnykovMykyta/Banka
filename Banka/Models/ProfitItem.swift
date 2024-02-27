//
//  ProfitItem.swift
//  Banka
//
//  Created by Nikita Melnikov on 27.02.2024.
//

import Foundation
import RealmSwift

class ProfitItem: Object {
    
    @Persisted(primaryKey: true) var id = UUID().uuidString
    @Persisted var date: Date = Date()
    @Persisted var profit: Int
    @Persisted var source: String
    
    convenience init(profit: Int, source: String) {
        self.init()
        self.profit = profit
        self.source = source
    }
}
