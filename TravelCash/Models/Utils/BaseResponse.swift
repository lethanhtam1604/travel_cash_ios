//
//  BaseResponse.swift
//  TravelCash
//
//  Created by Thanh-Tam Le on 6/27/17.
//  Copyright © 2017 Tam. All rights reserved.
//

import UIKit
import ObjectMapper

class BaseResponse: Mappable {

    var status: String = ""
    var error: String = ""

    init() {
        
    }

    required init?(map: Map) {

    }

    func mapping(map: Map) {
        status <- map["status"]
        error <- map["error"]
    }
}
