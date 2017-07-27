//
//  LocationResponse.swift
//  TravelCash
//
//  Created by Thanh-Tam Le on 6/29/17.
//  Copyright © 2017 Tam. All rights reserved.
//

import UIKit
import ObjectMapper

class LocationResponse: BaseResponse {

    var branches = [Location]()
    
    override init() {
        super.init()
    }

    required init?(map: Map){
        super.init(map: map)
    }

    override func mapping(map: Map) {
        super.mapping(map: map)
        branches <- map["branches"]
    }
}
