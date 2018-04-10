//
//  AccessToken.swift
//  MyQiita
//
//  Created by ちゅーたつ on 2018/04/08.
//  Copyright © 2018年 ちゅーたつ. All rights reserved.
//

import Foundation

struct AccessToken: Codable {
    var token: String
    var client_id: String
    var scopes: [String]
}


struct AccessTokenPostRequest: Request {
    
    typealias ResponseType = AccessToken
    
    struct Param: Encodable {
        var client_id = Config.clientId
        var client_secret = Config.secret
        var code: String
        
        init(code: String) {
            self.code = code
        }
    }
    
    var url = "https://qiita.com/api/v2/access_tokens"
    var code: String
    
    init(code: String) {
        self.code = code
    }
    
    func build() -> URLRequest {
        
        var request = URLRequest(url: URL(string: url)!)
        
        let param = Param(code: code)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try! JSONEncoder().encode(param)
        
        return request
    }
}
