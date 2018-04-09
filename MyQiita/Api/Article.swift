//
//  Article.swift
//  MyQiita
//
//  Created by ちゅーたつ on 2018/04/07.
//  Copyright © 2018年 ちゅーたつ. All rights reserved.
//

import Foundation

struct Article: Codable {
    var body: String
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


struct ArticlePostRequest: Request {
    
    typealias ResponseType = [Article]
    var url = ""
    
    private var page: Int
    private var perPage: Int
    
    init(page: Int, perPage: Int) {
        self.page = page
        self.perPage = perPage
    }

    func build() -> URLRequest {

        var request = URLComponents(string: "https://qiita.com/api/v2/items")
        request?.queryItems = [
            URLQueryItem(name: "page", value: "\(page)"),
            URLQueryItem(name: "per_page", value: "\(perPage)")
        ]
        
        
        return URLRequest(url: (request?.url)!)
    }
}
