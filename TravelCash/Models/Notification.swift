
//
//  Notification.swift
//  TravelCash
//
//  Created by Thanh-Tam Le on 6/21/17.
//  Copyright © 2017 Tam. All rights reserved.
//

import UIKit
import ObjectMapper

class Notification: Mappable {

    var id = 0
    var type: String = ""
    var message: String = ""
    var read_stamp: String = ""

    init() {

    }

    required init?(map: Map) {

    }

    func mapping(map: Map) {
        id <- map["id"]
        type <- map["type"]
        message <- map["message"]
        read_stamp <- map["read_stamp"]
    }
}
