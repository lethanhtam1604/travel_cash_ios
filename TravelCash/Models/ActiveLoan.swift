//
//  ActiveLoan.swift
//  TravelCash
//
//  Created by Thanh-Tam Le on 7/2/17.
//  Copyright © 2017 Tam. All rights reserved.
//

import UIKit
import ObjectMapper

class ActiveLoan: Mappable {

    var LoanId: String = ""
    var `Type`: String = ""
    var Arrears: String = ""
    var Balance: String = ""

    init() {

    }

    required init?(map: Map) {

    }

    func mapping(map: Map) {
        LoanId <- map["LoanId"]
        Type <- map["Type"]
        Arrears <- map["Arrears"]
        Balance <- map["Balance"]
    }
}
