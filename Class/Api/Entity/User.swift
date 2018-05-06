//
//  User.swift
//  MyQiita
//
//  Created by ちゅーたつ on 2018/05/06.
//  Copyright © 2018年 ちゅーたつ. All rights reserved.
//

import Foundation

struct User: Codable {
    var id: String = ""
    var name: String = ""
    var description: String = ""
    var iconUrl: String = ""
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case description = "description"
        case iconUrl = "profile_image_url"
    }
}
