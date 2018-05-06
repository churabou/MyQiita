//
//  LoginUserController.swift
//  MyQiita
//
//  Created by ちゅーたつ on 2018/04/09.
//  Copyright © 2018年 ちゅーたつ. All rights reserved.
//

import UIKit
import RxSwift

class AuthedUserController: UIViewController {

    private var navigator: AuthedUserNavigator?
    private var viewModel = AuthedUserViewModel()
    private var baseView = AuthedUserView()
    private let bag = DisposeBag()
    
    override func loadView() {
        self.view = baseView
    }
    
    override func viewDidLoad() {
        navigator = AuthedUserNavigator(controller: self)
        baseView.delegate = self
        configureObserver()
        viewModel.fetchProfile()
        //Todo: BaseViewのupdateConstraintsが呼ばれなかった。LoginControllerでは呼ばれていたのになぜ？
        baseView.setNeedsUpdateConstraints()
    }
    
    func configureObserver() {
        viewModel.user.asObservable().subscribe(onNext: { (user) in
            self.baseView.update(user: user)
        }).disposed(by: bag)
    }
}

extension AuthedUserController: AuthedUserViewDelegate {
    
    func didTapStart() {
        navigator?.navigate(to: .home, style: .modal)
    }
}
