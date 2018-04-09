//
//  AuthViewNavigator.swift
//  MyQiita
//
//  Created by ちゅーたつ on 2018/04/09.
//  Copyright © 2018年 ちゅーたつ. All rights reserved.
//

import UIKit

class AuthViewNavigator: Navigator {

    enum Direction {
        case login
    }
    
    func dismiss(to: Direction) {
        
        if let n = controller.presentingViewController as? UINavigationController,
            let c = n.viewControllers.first as? LoginController {
            controller.dismiss(animated: true, completion: {
                c.loginSuccess()
            })
        }
    }
}

