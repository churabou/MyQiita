//
//  Qiita.swift
//  MyQiita
//
//  Created by ちゅーたつ on 2018/04/06.
//  Copyright © 2018年 ちゅーたつ. All rights reserved.
//

import Foundation

struct QiitaSession {
    
    static func send<T: Request>(_ request: T, completion: @escaping (APIResponse<T.ResponseType>)->Swift.Void) where T.ResponseType: Decodable {
        
        URLSession.shared.dataTask(with: request.build()) { data, response, error in
            
            guard let jsonData = data else {
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                return
            }

            let status = httpResponse.statusCode
            print(status)

            do {
                let model = try request.decode(jsonData)
                completion(.success(response: model))
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}

protocol Request {
    associatedtype ResponseType
    var url: String { get }
    func build() -> URLRequest
}



extension Request where ResponseType: Decodable {
    
    func decode(_ jsonData: Data) throws -> ResponseType {
        return try JSONDecoder().decode(ResponseType.self, from: jsonData)
    }
}

enum APIResponse<ResponseType> {
    case success(response: ResponseType)
    case failure(message: String)
}


struct ArticlePostRequest: Request {
    
    typealias ResponseType = [Article]
    var url = ""
    
    func build() -> URLRequest {
        return URLRequest(url: URL(string: "https://qiita.com/api/v2/items")!)
    }
}


struct AccessTokenPostRequest: Request {

    typealias ResponseType = AccessToken

    struct Param: Encodable {
        var client_id: String
        var client_secret: String
        var code: String
        
        init(code: String) {
            self.client_id = Config.clientId
            self.client_secret = Config.secret
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

struct AccessToken: Codable {
    var token: String
}
