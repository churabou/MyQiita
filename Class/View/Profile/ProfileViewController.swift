//
//  Profile.swift
//  MyQiita
//
//  Created by ちゅーたつ on 2018/04/10.
//  Copyright © 2018年 ちゅーたつ. All rights reserved.
//

import UIKit


class ProfileViewController: UIViewController {

    fileprivate var navigator: ProfileNavigator?
    
    private var baseView = ProfileView()

    override func loadView() {
        self.view = baseView
    }
    override func viewDidLoad() {
        baseView.delegate = self
        baseView.update(user: Config.user!)
        navigator = ProfileNavigator(controller: self)
    }
}

extension ProfileViewController: ProfileViewDelegate {
    
    func didTapLogout() {
        navigator?.navigate(to: .login, style: .modal, animated: false)
    }
}
