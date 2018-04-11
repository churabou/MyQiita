//
//  UserDefaults.swift
//  MyQiita
//
//  Created by ちゅーたつ on 2018/04/11.
//  Copyright © 2018年 ちゅーたつ. All rights reserved.
//


//userdefaultに保存する値は面倒なのでaccesstokenとuserなのでまとめた。

import Foundation


extension UserDefaults {

    static var savedToken: String {
         return UserDefaults.standard.string(forKey: "access_toeken_key") ?? ""
    }
    
    static func save(token: String) {
        UserDefaults.standard.set(token, forKey: "access_toeken_key")
    }
    
    static func save(user: User) {

        let data = try? JSONEncoder().encode(user)
        UserDefaults.standard.set(data, forKey:"auto_memories_doll")
    }
    
    
    static var savedUser: User? {
        guard let data = UserDefaults.standard.data(forKey: "auto_memories_doll") else {
            return nil
        }
        let user = try? JSONDecoder().decode(User.self, from: data)
        return user
    }
    
}
