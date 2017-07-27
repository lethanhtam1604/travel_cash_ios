//
//  UserResponse.swift
//  TravelCash
//
//  Created by Thanh-Tam Le on 6/27/17.
//  Copyright © 2017 Tam. All rights reserved.
//

import UIKit
import ObjectMapper

class UserResponse: BaseResponse {

    var user: User?

    override init() {
        super.init()
    }

    required init?(map: Map){
        super.init(map: map)
    }

    override func mapping(map: Map) {
        super.mapping(map: map)
        user <- map["user"]
    }
}
