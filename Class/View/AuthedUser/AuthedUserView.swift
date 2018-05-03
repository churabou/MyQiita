//
//  AuthedUserView.swift
//  MyQiita
//
//  Created by ちゅーたつ on 2018/05/03.
//  Copyright © 2018年 ちゅーたつ. All rights reserved.
//

import SnapKit
import Kingfisher

protocol AuthedUserViewDelegate: class {
    func didTapStart()
}

class AuthedUserView: BaseView {
    
    weak var delegate: AuthedUserViewDelegate?
    
    func update(name: String, icon: String) {
        label.text = "logging as \(name)"
        imageView.kf.setImage(with: URL(string: icon))
    }
    
    private lazy var imageView: UIImageView = {
        let v = UIImageView()
        v.setAutolayout()
        v.backgroundColor = .red
        return v
    }()
    
    private lazy var label: UILabel = {
        let l = UILabel.default
        l.textColor = .white
        l.text = "logging"
        return l
    }()
    
    private lazy var startButton: UIButton = {
        let b = UIButton()
        b.setAutolayout()
        b.backgroundColor = .pink
        b.setTitle("はじめる", for: .normal)
        b.setTitleColor(.white, for: .normal)
        b.addTarget(self, action: #selector(actionStart), for: .touchUpInside)
        b.layer.borderWidth = 2
        b.layer.borderColor = UIColor.white.cgColor
        b.layer.cornerRadius = 25
        return b
    }()
    
    @objc private func actionStart() {
        delegate?.didTapStart()
    }
    
    override func initializeView() {
        backgroundColor = .pink
        addSubview(imageView)
        addSubview(label)
        addSubview(startButton)
    }
    
    override func initializeConstraints() {
    
        imageView.snp.makeConstraints { (make) in
            make.size.equalTo(150)
            make.center.equalToSuperview()
        }
        
        label.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.height.equalTo(30)
            make.top.equalTo(imageView.snp.bottom).offset(5)
        }
        
        startButton.snp.makeConstraints { (make) in
            make.width.equalTo(250)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(-60)
        }
    }
}

extension UILabel {
    
    static var `default`: UILabel {
        let l = UILabel()
        l.setAutolayout()
        l.font = UIFont.systemFont(ofSize: 16)
        l.textAlignment = .center
        return l
    }
}
