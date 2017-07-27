//
//  Statement.swift
//  TravelCash
//
//  Created by Thanh-Tam Le on 7/2/17.
//  Copyright © 2017 Tam. All rights reserved.
//

import UIKit
import ObjectMapper

class Statement: Mappable {

    var Description: String = ""
    var TransactionDate: String = ""
    var TransactionAmount: String = ""

    init() {

    }

    required init?(map: Map) {

    }

    func mapping(map: Map) {
        Description <- map["Description"]
        TransactionDate <- map["TransactionDate"]
        TransactionAmount <- map["TransactionAmount"]
    }
}
