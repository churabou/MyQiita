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

