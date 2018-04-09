//
//  LoginNavigator.swift
//  MyQiita
//
//  Created by ちゅーたつ on 2018/04/09.
//  Copyright © 2018年 ちゅーたつ. All rights reserved.
//

import UIKit

class LoginNavigator: Navigator, Navigatable {

    typealias DirectionType = Direction

    enum Direction {
        case auth, loginUser
    }
    
    func controller(_ to: DirectionType) -> UIViewController {

        switch to {
        case .auth:
            return AuthController()
        case .loginUser:
            return LoginUserController()
        }
    }
}
