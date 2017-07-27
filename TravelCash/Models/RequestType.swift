//
//  RequestType.swift
//  TravelCash
//
//  Created by Thanh-Tam Le on 7/8/17.
//  Copyright © 2017 Tam. All rights reserved.
//

import UIKit
import ObjectMapper

class RequestType: Mappable {

    var id: String = ""
    var name: String = ""
    var requestId: String = ""
    var requestType: String = ""

    init() {

    }

    required init?(map: Map) {

    }

    func mapping(map: Map) {
        id <- map["0"]
        name <- map["1"]
        requestId <- map["RequestId"]
        requestType <- map["RequestType"]
    }
}
