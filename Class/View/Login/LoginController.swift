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

    private lazy var loginButton: UIButton = {
        let b = UIButton()
        b.backgroundColor = .pink
        b.setTitle("ログインする", for: .normal)
        b.setTitleColor(.white, for: .normal)
        b.addTarget(self, action: #selector(actionLogin), for: .touchUpInside)
        b.layer.borderWidth = 2
        b.layer.borderColor = UIColor.white.cgColor
        b.layer.cornerRadius = 30
        return b
    }()
    
    @objc private func actionLogin() {
        navigator?.navigate(to: .auth, style: .modal)
    }
    
    override func viewDidLoad() {
        navigator = LoginNavigator(controller: self)
        view.backgroundColor = .pink
        view.addSubview(loginButton)
        
        
        loginButton.snp.makeConstraints { (make) in
            make.width.equalTo(250)
            make.height.equalTo(60)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(-60)
        }
    }
    
    func loginSuccess() {
        navigator?.navigate(to: .loginUser)
    }
}
