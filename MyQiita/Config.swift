//
//  Config.swift
//  MyQiita
//
//  Created by ちゅーたつ on 2018/04/08.
//  Copyright © 2018年 ちゅーたつ. All rights reserved.
//

import Foundation

struct Config {

    static var token: String {
        return UserDefaults.savedToken
    }
    
    static var user: User? {
        return UserDefaults.savedUser
    }
}



