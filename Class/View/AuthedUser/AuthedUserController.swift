//
//  LoginUserController.swift
//  MyQiita
//
//  Created by ちゅーたつ on 2018/04/09.
//  Copyright © 2018年 ちゅーたつ. All rights reserved.
//

import UIKit


class AuthedUserController: UIViewController {

    private var navigator: AuthedUserNavigator?
    private var viewModel = AuthedUserViewModel()
    private var baseView = AuthedUserView()
    
    override func loadView() {
        self.view = baseView
    }
    
    override func viewDidLoad() {
        navigator = AuthedUserNavigator(controller: self)
        viewModel.fetchProfile()
        baseView.delegate = self
        //Todo: BaseViewのupdateConstraintsが呼ばれなかった。
        baseView.setNeedsUpdateConstraints()
        baseView.layoutIfNeeded()
    }
}

extension AuthedUserController: AuthedUserViewDelegate {
    
    func didTapStart() {
        navigator?.navigate(to: .home, style: .modal)
    }
}
