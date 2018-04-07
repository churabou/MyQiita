//
//  Qiita.swift
//  MyQiita
//
//  Created by ちゅーたつ on 2018/04/06.
//  Copyright © 2018年 ちゅーたつ. All rights reserved.
//

import Foundation

struct Item: Codable {
    var title: String
    var user: User
    struct User: Codable {
        var id: String
        var iconUrl: String
        enum CodingKeys: String, CodingKey {
            case id = "id"
            case iconUrl = "profile_image_url"
        }
    }
    var url: String
    var tags: [Tag]
    struct Tag: Codable {
        var name: String
    }
}

struct Qiita {
    
    func fetchItem(completion: @escaping ([Item]) -> Swift.Void) {
        
        let url = "https://qiita.com/api/v2/items"
        guard var urlComponents = URLComponents(string: url) else {
            return
        }

        urlComponents.queryItems = [
            URLQueryItem(name: "perpage", value: "30"),
        ]

        let task = URLSession.shared.dataTask(with: urlComponents.url!) { data, response, error in
            
            guard let jsonData = data else {
                return
            }

            do {
                let items = try JSONDecoder().decode([Item].self, from: jsonData)
                completion(items)
            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
}
