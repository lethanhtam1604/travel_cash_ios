//
//  Location.swift
//  TravelCash
//
//  Created by Thanh-Tam Le on 6/20/17.
//  Copyright © 2017 Tam. All rights reserved.
//

import UIKit
import ObjectMapper

class Location: Mappable {

    var Community: String = ""
    var Location: String = ""
    var Latitude: String = ""
    var Langitude: String = ""
    var PhoneNo: String = ""
    var FaxNo: String = ""

    var phones = [String]()
    var faxes = [String]()

    init() {

    }

    required init?(map: Map) {

    }

    func mapping(map: Map) {
        Community <- map["Community"]
        Location <- map["Location"]
        Latitude <- map["Latitude"]
        Langitude <- map["Langitude"]
        PhoneNo <- map["PhoneNo"]
        FaxNo <- map["FaxNo"]
    }
}
