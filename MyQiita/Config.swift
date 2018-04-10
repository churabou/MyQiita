//
//  Config.swift
//  MyQiita
//
//  Created by ちゅーたつ on 2018/04/08.
//  Copyright © 2018年 ちゅーたつ. All rights reserved.
//

import Foundation

struct Config {
    static let clientId = ""
    static let secret = ""
    static var token: String {
        return UserDefaults.standard.string(forKey: "access_toeken_key") ?? ""
    }
    
    static var user: User? {
        guard let data = UserDefaults.standard.data(forKey: "auto_memories_doll") else {
            return nil
        }
        let user = try? JSONDecoder().decode(User.self, from: data)
        return user
    }
}



