//
//  PromotionResponse.swift
//  TravelCash
//
//  Created by Thanh-Tam Le on 7/2/17.
//  Copyright © 2017 Tam. All rights reserved.
//

import UIKit
import ObjectMapper

class PromotionResponse: BaseResponse {

    var promotions = [Promotion]()
    var date: String = ""

    override init() {
        super.init()
    }

    required init?(map: Map){
        super.init(map: map)
    }

    override func mapping(map: Map) {
        super.mapping(map: map)
        promotions <- map["promotions"]
        date <- map["date"]
    }
}
