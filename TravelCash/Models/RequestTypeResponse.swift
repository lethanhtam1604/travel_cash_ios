//
//  RequestTypeResponse.swift
//  TravelCash
//
//  Created by Thanh-Tam Le on 7/8/17.
//  Copyright © 2017 Tam. All rights reserved.
//

import UIKit
import ObjectMapper

class RequestTypeResponse: BaseResponse {

    var requestTypes = [RequestType]()

    override init() {
        super.init()
    }

    required init?(map: Map){
        super.init(map: map)
    }

    override func mapping(map: Map) {
        super.mapping(map: map)
        requestTypes <- map["types"]
    }
}
