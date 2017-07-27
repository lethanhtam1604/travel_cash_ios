//
//  UserDefaultManager.swift
//  MyLifeMatters
//
//  Created by Thanh-Tam Le on 11/29/16.
//  Copyright © 2016 Thanh-Tam Le. All rights reserved.
//

import UIKit

class UserDefaultManager {

    private static var sharedInstance: UserDefaultManager!
    
    private let defaults = UserDefaults.standard
    
    private let isLogin = "isLogin"
    private let trn = "trn"
    private let pass = "pass"


    static func getInstance() -> UserDefaultManager {
        if(sharedInstance == nil) {
            sharedInstance = UserDefaultManager()
        }
        return sharedInstance
    }
    
    private init() {
        
    }

    func setLogin(value: Bool) {
        defaults.set(value, forKey: isLogin)
        defaults.synchronize()
    }
    
    func is_Login() -> Bool {
        return defaults.bool(forKey: isLogin)
    }

    func setTRN(value: String) {
        defaults.set(value, forKey: trn)
        defaults.synchronize()
    }

    func getTRN() -> String? {
        return defaults.string(forKey: trn)
    }

    func setPass(value: String) {
        defaults.set(value, forKey: pass)
        defaults.synchronize()
    }

    func getPass() -> String? {
        return defaults.string(forKey: pass)
    }
}
