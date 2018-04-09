//
//  AuthViewNavigator.swift
//  MyQiita
//
//  Created by ちゅーたつ on 2018/04/09.
//  Copyright © 2018年 ちゅーたつ. All rights reserved.
//

import UIKit

class AuthViewNavigator {
    
    var viewController = UIViewController()
    
    convenience init(_ vc: UIViewController) {
        self.init()
        self.viewController = vc
    }
    
    enum Direction {
        case home, login
    }
    
    func navigate(_ to: Direction) {
        
        switch to {
        case .home:
            let c = ViewController()
            let n = UINavigationController(rootViewController: c)
            viewController.present(n, animated: true, completion: nil)
        default:
            return
        }
    }
}

