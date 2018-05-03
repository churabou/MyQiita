//
//  LoginView.swift
//  MyQiita
//
//  Created by ちゅーたつ on 2018/05/03.
//  Copyright © 2018年 ちゅーたつ. All rights reserved.
//

import SnapKit

protocol LoginViewDelegate: class {
    func didTapLogin()
}
class LoginView: BaseView {
 
    weak var delegate: LoginViewDelegate?

    private lazy var loginButton: UIButton = {
        let b = UIButton()
        b.setAutolayout()
        b.backgroundColor = .pink
        b.setTitle("ログインする", for: .normal)
        b.setTitleColor(.white, for: .normal)
        b.addTarget(self, action: #selector(actionLogin), for: .touchUpInside)
        b.layer.borderWidth = 2
        b.layer.borderColor = UIColor.white.cgColor
        b.layer.cornerRadius = 25
        return b
    }()
    
    private lazy var titleLabel: UILabel = {
        let l = UILabel()
        l.setAutolayout()
        l.text = "welcome to my qiita client"
        l.textColor = .white
        l.textAlignment = .center
        l.font = UIFont.systemFont(ofSize: 16)
        return l
    }()

    override func initializeView() {
        backgroundColor = .pink
        addSubview(titleLabel)
        addSubview(loginButton)
    }

    override func initializeConstraints() {
        
        titleLabel.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.height.equalTo(30)
            make.bottom.equalTo(loginButton.snp.top).offset(-20)
        }
        
        loginButton.snp.makeConstraints { (make) in
            make.width.equalTo(250)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(-60)
        }
    }

    @objc private func actionLogin() {
       delegate?.didTapLogin()
    }
}
