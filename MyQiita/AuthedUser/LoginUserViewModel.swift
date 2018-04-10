//
//  LoginUserViewModel.swift
//  MyQiita
//
//  Created by ちゅーたつ on 2018/04/09.
//  Copyright © 2018年 ちゅーたつ. All rights reserved.
//

import Foundation

class LoginUserViewModel {
    
    func fetchProfile() {

        let request = AuthenticatedUserGetRequest()
        QiitaSession.send(request) { (response) in
            switch response {
            case .success(let user):
                print(user)
                self.addUserdefaults(user: user)
            case .failure(let message):
                print("失敗した。\(message)")
            }
        }
    }
    
    func addUserdefaults(user: User) {
        let data = try? JSONEncoder().encode(user)
        UserDefaults.standard.set(data, forKey:"auto_memories_doll")
        print(user.id)
        print("保存した")
    }
}
