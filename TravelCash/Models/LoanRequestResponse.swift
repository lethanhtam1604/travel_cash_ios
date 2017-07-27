//
//  LoanRequestResponse.swift
//  TravelCash
//
//  Created by Thanh-Tam Le on 7/9/17.
//  Copyright © 2017 Tam. All rights reserved.
//

import UIKit
import ObjectMapper

class LoanRequestResponse: BaseResponse {

    var loanRequestId: String = ""
    var code = 0

    override init() {
        super.init()
    }

    required init?(map: Map){
        super.init(map: map)
    }

    override func mapping(map: Map) {
        super.mapping(map: map)
        loanRequestId <- map["loanRequestId"]
        code <- map["code"]
    }
}
