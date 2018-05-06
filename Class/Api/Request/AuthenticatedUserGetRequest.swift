//
//  UserGetRequest.swift
//  MyQiita
//
//  Created by ちゅーたつ on 2018/04/09.
//  Copyright © 2018年 ちゅーたつ. All rights reserved.
//

import Foundation

struct AuthenticatedUserGetRequest: Request {
    
    typealias ResponseType = User
    
    struct Param: Encodable {
        var access_token = Config.token
    }
    
    var url = "https://qiita.com/api/v2/authenticated_user"
    
    func build() -> URLRequest {
        
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("Bearer \(Config.token)", forHTTPHeaderField: "Authorization")
        return request
    }
}
