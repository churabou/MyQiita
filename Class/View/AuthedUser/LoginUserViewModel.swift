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
                UserDefaults.save(user: user)
            case .failure(let message):
                print("失敗した。\(message)")
            }
        }
    }
}
