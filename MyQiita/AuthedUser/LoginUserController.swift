//
//  LoginUserController.swift
//  MyQiita
//
//  Created by ちゅーたつ on 2018/04/09.
//  Copyright © 2018年 ちゅーたつ. All rights reserved.
//

import UIKit


class LoginUserController: UIViewController {

    private var navigator: LoginUserNavigator?
    
    private lazy var startButton: UIButton = {
        let b = UIButton()
        b.backgroundColor = .pink
        b.setTitle("はじめる", for: .normal)
        b.setTitleColor(.white, for: .normal)
        b.addTarget(self, action: #selector(actionStart), for: .touchUpInside)
        b.layer.borderWidth = 2
        b.layer.borderColor = UIColor.white.cgColor
        b.layer.cornerRadius = 30
        return b
    }()
    
    @objc private func actionStart() {
        navigator?.navigate(to: .home, style: .modal)
    }
    
    override func viewDidLoad() {
        navigator = LoginUserNavigator(controller: self)
        view.backgroundColor = .pink
        view.addSubview(startButton)
        
        startButton.snp.makeConstraints { (make) in
            make.width.equalTo(250)
            make.height.equalTo(60)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(-60)
        }
    }
}
