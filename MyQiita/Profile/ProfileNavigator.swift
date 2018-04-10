//
//  ProfileNavigator.swift
//  MyQiita
//
//  Created by ちゅーたつ on 2018/04/10.
//  Copyright © 2018年 ちゅーたつ. All rights reserved.
//

import UIKit


class ProfileNavigator: Navigator, Navigatable {

    typealias DirectionType = Direction

    enum Direction {
        case login, follow, follower
    }
    
    func controller(_ to: Direction) -> UIViewController {
        switch to {
        case .login:
            return UINavigationController(rootViewController: LoginController())
        default:
            return UIViewController()
        }
    }
}
