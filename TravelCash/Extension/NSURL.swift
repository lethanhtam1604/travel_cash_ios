//
//  NSURL.swift
//  TravelCash
//
//  Created by Thanh-Tam Le on 7/9/17.
//  Copyright © 2017 Tam. All rights reserved.
//

import UIKit

extension URL  {

    func mimeType() -> String {
        let mimeType = MimeType()
        return mimeType.MimeType(ext: self.pathExtension)
    }
}
