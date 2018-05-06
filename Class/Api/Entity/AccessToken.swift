//
//  AccessToken.swift
//  MyQiita
//
//  Created by ちゅーたつ on 2018/05/06.
//  Copyright © 2018年 ちゅーたつ. All rights reserved.
//

import Foundation

struct AccessToken: Codable {
    var token: String
    var client_id: String
    var scopes: [String]
}
