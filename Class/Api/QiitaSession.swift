//
//  Qiita.swift
//  MyQiita
//
//  Created by ちゅーたつ on 2018/04/06.
//  Copyright © 2018年 ちゅーたつ. All rights reserved.
//

import Foundation

enum APIResponse<ResponseType> {
    case success(response: ResponseType)
    case failure(message: String)
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

struct QiitaSession {
    
    static func send<T: Request>(_ request: T, completion: @escaping (APIResponse<T.ResponseType>)->Swift.Void) where T.ResponseType: Decodable {
        
        URLSession.shared.dataTask(with: request.build()) { data, response, error in
            
            guard let jsonData = data else {
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                return
            }

            if case (200..<300) = httpResponse.statusCode {
                
                do {
                    let model = try request.decode(jsonData)
                    DispatchQueue.main.async {
                        completion(.success(response: model))
                    }
                } catch {
                    print(error.localizedDescription)
                }
            } else {
                completion(.failure(message: "code: \(httpResponse.statusCode)"))
            }
        }.resume()
    }
}





