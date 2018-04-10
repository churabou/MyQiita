//
//  ArticlePostRequest.swift
//  MyQiita
//
//  Created by ちゅーたつ on 2018/04/10.
//  Copyright © 2018年 ちゅーたつ. All rights reserved.
//

import Foundation


struct ArticlePostRequest: Request {
    
    typealias ResponseType = [Article]
    
    var url: String {
        switch target {
        case .new:
            return "https://qiita.com/api/v2/items"
        case .userStock:
            return "https://qiita.com/api/v2/users/\(Config.user!.id)/stocks"
        case .userPost:
            return "https://qiita.com/api/v2/users/\(Config.user!.id)/items"
        }
    }
    
    private var target: Target
    private var page: Int
    private var perPage: Int
    
    enum Target {
        case new
        case userStock
        case userPost
    }

    init(_ target: Target, page: Int, perPage: Int) {
        self.target = target
        self.page = page
        self.perPage = perPage
    }
    
    func build() -> URLRequest {
        
        var request = URLComponents(string: url)
        request?.queryItems = [
            URLQueryItem(name: "page", value: "\(page)"),
            URLQueryItem(name: "per_page", value: "\(perPage)")
        ]
        
        
        return URLRequest(url: (request?.url)!)
    }
}


