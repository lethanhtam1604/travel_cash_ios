//
//  Promotion.swift
//  TravelCash
//
//  Created by Thanh-Tam Le on 7/2/17.
//  Copyright © 2017 Tam. All rights reserved.
//

import UIKit
import ObjectMapper

class Promotion: Mappable {

    var id: String = ""
    var name: String = ""
    var banner_small: String = ""
    var banner_large: String = ""
    var active: String = ""
    var likes: String = ""
    var views: String = ""
    var liked: String = ""

    init() {

    }

    required init?(map: Map) {

    }

    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        banner_small <- map["banner_small"]
        banner_large <- map["banner_large"]
        active <- map["active"]
        likes <- map["likes"]
        views <- map["views"]
        liked <- map["liked"]
    }
}
