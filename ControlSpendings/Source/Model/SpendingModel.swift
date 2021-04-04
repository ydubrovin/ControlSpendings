//
//  SpendingModel.swift
//  ControlSpendings
//
//  Created by Юрий Дубровин on 03.04.2021.
//

import Foundation

import Foundation
import RealmSwift

class SpendingModel: Object{
    @objc dynamic var id = 0
    @objc dynamic var name = ""
    @objc dynamic var price  = ""
    @objc dynamic var date = Date(timeIntervalSince1970: 1)
    @objc dynamic var cycle = ""
    @objc dynamic var currency = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
