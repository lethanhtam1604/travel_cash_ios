//
//  User.swift
//  TravelCash
//
//  Created by Thanh-Tam Le on 6/14/17.
//  Copyright © 2017 Tam. All rights reserved.
//

import UIKit
import ObjectMapper

class User: Mappable {

    var user_id: String = ""
    var first_name: String = ""
    var surname: String = ""
    var email: String = ""
    var trn: String = ""
    var auth_code: String = ""
    var address_1: String = ""
    var address_2: String = ""
    var parish: String = ""
    var phone_number: String = ""
    var pass: String = ""
    var notification_on: String = ""
    var gcm_token: String = ""
    var dob: String = ""
    var avatarUrl: String = ""

    init() {

    }

    required init?(map: Map) {

    }

    func mapping(map: Map) {
        user_id <- map["user_id"]
        first_name <- map["first_name"]
        surname <- map["surname"]
        email <- map["email"]
        trn <- map["trn"]
        auth_code <- map["auth_code"]
        address_1 <- map["address_1"]
        address_2 <- map["address_2"]
        parish <- map["parish"]
        phone_number <- map["phone_number"]
        pass <- map["pass"]
        notification_on <- map["notification_on"]
        gcm_token <- map["gcm_token"]
        dob <- map["dob"]
    }
}
