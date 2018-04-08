//
//  Qiita.swift
//  MyQiita
//
//  Created by ちゅーたつ on 2018/04/06.
//  Copyright © 2018年 ちゅーたつ. All rights reserved.
//

import Foundation
//
//struct Qiita {
//    
//    func fetchItem(completion: @escaping ([Item]) -> Swift.Void) {
//        
//        let url = "https://qiita.com/api/v2/items"
//        guard var urlComponents = URLComponents(string: url) else {
//            return
//        }
//
//        urlComponents.queryItems = [
//            URLQueryItem(name: "perpage", value: "30"),
//        ]
//
//        let task = URLSession.shared.dataTask(with: urlComponents.url!) { data, response, error in
//            
//            guard let jsonData = data else {
//                return
//            }
//
//            do {
//                let items = try JSONDecoder().decode([Item].self, from: jsonData)
//                completion(items)
//            } catch {
//                print(error.localizedDescription)
//            }
//        }
//        task.resume()
//    }
//}

struct QiitaSession {
    
    static func send<T: Request>(_ request: T, completion: @escaping (APIResponse<T.ResponseType>)->Swift.Void) where T.ResponseType: Decodable {
        
        URLSession.shared.dataTask(with: request.create()) { data, response, error in
            
            guard let jsonData = data else {
                return
            }
            
//            guard let httpResponse = response as? HTTPURLResponse else {
//                return
//            }
//
//            let status = httpResponse.statusCode
//
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
}

extension Request {
    
    func create() -> URLRequest {
        return URLRequest(url: URL(string: "https://qiita.com/api/v2/items")!)
    }
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
}

//この段階でビルドが通っても
//send<T: Request>(_ request: T, completion: @escaping (APIResponse<T.ResponseType>)->Swift.Void) {

