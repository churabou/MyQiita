//
//  loginViewController.swift
//  MyQiita
//
//  Created by ちゅーたつ on 2018/04/08.
//  Copyright © 2018年 ちゅーたつ. All rights reserved.
//

import SnapKit


class LoginViewController: UIViewController {
    
    private var webView = UIWebView()
    private var viewModel: LoginViewModel!
    private var navigator: LoginViewNavigator!
    
    override func viewDidLoad() {

        view.addSubview(webView)
        
        webView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }

        navigator = LoginViewNavigator(self)
        viewModel = LoginViewModel(navigator)
        webView.delegate = viewModel
    }
    
    override func viewDidAppear(_ animated: Bool) {
        viewModel.loadLoginPage(webView)
    }
}
