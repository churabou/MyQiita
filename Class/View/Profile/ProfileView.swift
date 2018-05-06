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
        v.clipsToBounds = true
        return v
    }()
    
    private lazy var nameLabel: UILabel = {
        let v = UILabel()
        v.setAutolayout()
        v.font = UIFont.systemFont(ofSize: 18)
        v.textColor = .gray
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
        profileWrapperView.addSubview(intoroLabel)
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()

        logoutButton.snp.makeConstraints { (make) in
            make.width.equalTo(100)
            make.top.equalTo(30)
            make.right.equalTo(-10)
            make.height.equalTo(30)
        }
        
        profileWrapperView.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.top.equalTo(logoutButton.snp.bottom).offset(10)
            make.height.equalTo(250)
        }
        
        iconView.snp.makeConstraints { (make) in
            make.size.equalTo(80)
            make.top.equalToSuperview()
            make.left.equalTo(20)
        }
        
        nameLabel.snp.makeConstraints { (make) in
            make.width.equalTo(200)
            make.top.equalTo(iconView.snp.top).offset(10)
            make.left.equalTo(iconView.snp.right).offset(20)
        }
        
        intoroLabel.snp.makeConstraints { (make) in
            make.top.equalTo(iconView.snp.bottom).offset(10)
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.bottom.equalToSuperview()
        }
    }
    
    func update(user: User) {
        
        iconView.kf.setImage(with: URL(string: user.iconUrl))
        nameLabel.text = user.id
        intoroLabel.text = user.description
        print(user.description)
    }
    //呼ぶにはどうするべきか
    override func updateConstraints() {
        super.updateConstraints()
    }
}
