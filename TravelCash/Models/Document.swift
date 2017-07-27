
//
//  Document.swift
//  TravelCash
//
//  Created by Thanh-Tam Le on 7/2/17.
//  Copyright © 2017 Tam. All rights reserved.
//

import UIKit

class Document: NSObject {

    var fileName: String = ""
    var mimeType: String = ""
    var trn: String = ""
    var name: String = ""
    var data: Data?

    init(name: String, fileName: String, mimeType: String, data: Data) {
        self.name = name
        self.fileName = fileName
        self.mimeType = mimeType
        self.data = data
    }
}
