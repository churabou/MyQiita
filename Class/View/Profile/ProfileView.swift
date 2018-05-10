//
//  ProfileView.swift
//  MyQiita
//
//  Created by ちゅーたつ on 2018/04/10.
//  Copyright © 2018年 ちゅーたつ. All rights reserved.
//

import SnapKit
import Kingfisher

protocol ProfileViewDelegate: class {
    func didTapLogout()
}

class ProfileView: BaseView {
    
    weak var delegate: ProfileViewDelegate?
    
    private lazy var logoutButton: UIButton = {
        let b = UIButton()
        b.setAutolayout()
        b.backgroundColor = .pink
        b.setTitle("ログアウト", for: .normal)
        b.setTitleColor(.white, for: .normal)
        b.addTarget(self, action: #selector(actionLogout), for: .touchUpInside)
        b.layer.borderWidth = 2
        b.layer.borderColor = UIColor.white.cgColor
        b.layer.cornerRadius = 4
        return b
    }()
    
    private lazy var profileWrapperView: UIView = {
        let v = UIView()
        v.setAutolayout()
        v.backgroundColor = .pink
        return v
    }()
    
    private lazy var iconView: UIImageView = {
        let v = UIImageView()
        v.setAutolayout()
        v.layer.cornerRadius = 40
        v.layer.borderWidth = 2
        v.layer.borderColor = UIColor.white.cgColor
        v.clipsToBounds = true
        return v
    }()
    
    private lazy var nameLabel: UILabel = {
        let v = UILabel()
        v.setAutolayout()
        v.font = UIFont.systemFont(ofSize: 20)
        v.textColor = .gray
        v.textAlignment = .center
        return v
    }()
    
    private lazy var followLabel: UILabel = {
        let v = UILabel()
        v.setAutolayout()
        v.font = UIFont.systemFont(ofSize: 10)
        v.textColor = .gray
        v.textAlignment = .center
        return v
    }()
    
    private lazy var intoroLabel: UILabel = {
        let v = UILabel()
        v.setAutolayout()
        v.font = UIFont.systemFont(ofSize: 16)
        v.textColor = .gray
        v.numberOfLines = 0
        return v
    }()
    
    
    @objc private func actionLogout() {
        delegate?.didTapLogout()
    }
    
    override func initializeView() {
        
        backgroundColor = .white
        addSubview(logoutButton)
        addSubview(profileWrapperView)
        profileWrapperView.addSubview(iconView)
        profileWrapperView.addSubview(nameLabel)
        profileWrapperView.addSubview(followLabel)
        addSubview(intoroLabel)
    }
    
    
    override func initializeConstraints() {
        
        logoutButton.snp.makeConstraints { (make) in
            make.width.equalTo(100)
            make.top.equalTo(30)
            make.right.equalTo(-10)
            make.height.equalTo(30)
        }
        
        profileWrapperView.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.top.equalTo(logoutButton.snp.bottom).offset(10)
            make.height.equalTo(150)
        }
        
        iconView.snp.makeConstraints { (make) in
            make.size.equalTo(80)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-25)
        }
        
        nameLabel.snp.makeConstraints { (make) in
            make.width.equalTo(200)
            make.top.equalTo(iconView.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
        }
        
        followLabel.snp.makeConstraints { (make) in
            make.width.equalTo(200)
            make.top.equalTo(nameLabel.snp.bottom)
            make.centerX.equalToSuperview()
            make.height.equalTo(20)
        }
        
        intoroLabel.snp.makeConstraints { (make) in
            make.top.equalTo(profileWrapperView.snp.bottom).offset(10)
            make.height.equalTo(300)
            make.left.equalTo(40)
            make.right.equalTo(-40)
        }
    }
    
    func update(user: User) {
        
        iconView.kf.setImage(with: URL(string: user.iconUrl))
        nameLabel.text = user.id
        intoroLabel.text = user.description
        followLabel.text = "follow \(user.following)  follower: \(user.follower)"
        print(user.description)
    }
}
