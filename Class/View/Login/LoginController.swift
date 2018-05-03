//
//  AuthController.swift
//  MyQiita
//
//  Created by ちゅーたつ on 2018/04/09.
//  Copyright © 2018年 ちゅーたつ. All rights reserved.
//

import UIKit

class LoginController: UIViewController {
    
    private var navigator: LoginNavigator?
    private var baseView = LoginView()

    override func loadView() {
        self.view = baseView
    }

    override func viewDidLoad() {
        baseView.delegate = self
        navigator = LoginNavigator(controller: self)
    }
    
    func loginSuccess() {
        navigator?.navigate(to: .loginUser)
    }
}

extension LoginController: LoginViewDelegate {
    
    func didTapLogin() {
         navigator?.navigate(to: .auth, style: .modal)
    }
}
