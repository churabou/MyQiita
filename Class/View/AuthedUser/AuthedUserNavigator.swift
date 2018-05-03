//
//  LoginUserNavigator.swift
//  MyQiita
//
//  Created by ちゅーたつ on 2018/04/09.
//  Copyright © 2018年 ちゅーたつ. All rights reserved.
//

import UIKit

class AuthedUserNavigator: Navigator, Navigatable {
    
    typealias DirectionType = Direction
    enum Direction {
        case home
    }
    
    func controller(_ to: Direction) -> UIViewController {
        switch to {
        case .home: return HomeViewController()
        }
    }
}
