//
//  Profile.swift
//  MyQiita
//
//  Created by ちゅーたつ on 2018/04/10.
//  Copyright © 2018年 ちゅーたつ. All rights reserved.
//

import UIKit


class ProfileViewController: UIViewController {
    
    private lazy var logoutButton: UIButton = {
        let b = UIButton()
        b.backgroundColor = .pink
        b.setTitle("ログアウト", for: .normal)
        b.setTitleColor(.white, for: .normal)
        b.addTarget(self, action: #selector(actionLogout), for: .touchUpInside)
        b.layer.borderWidth = 2
        b.layer.borderColor = UIColor.white.cgColor
        b.layer.cornerRadius = 4
        return b
    }()
    
    fileprivate var navigator: ProfileNavigator?
    
    override func viewDidLoad() {
        
        view.backgroundColor = .white
        view.addSubview(logoutButton)
        
        logoutButton.snp.makeConstraints { (make) in
            make.width.equalTo(100)
            make.top.equalTo(30)
            make.right.equalTo(-10)
            make.height.equalTo(30)
        }

        navigator = ProfileNavigator(controller: self)
    }
    
    @objc private func actionLogout() {
        navigator?.navigate(to: .login, style: .modal, animated: false)
    }
}
