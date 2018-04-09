//
//  AuthController.swift
//  MyQiita
//
//  Created by ちゅーたつ on 2018/04/08.
//  Copyright © 2018年 ちゅーたつ. All rights reserved.
//

import SnapKit


class AuthController: UIViewController {
    
    private var webView = UIWebView()
    private var viewModel: AuthViewModel!
    private var navigator: AuthViewNavigator!
    
    override func viewDidLoad() {

        view.addSubview(webView)
        
        webView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }

        navigator = AuthViewNavigator(controller: self)
        viewModel = AuthViewModel(navigator)
        webView.delegate = viewModel
    }
    
    override func viewDidAppear(_ animated: Bool) {
        viewModel.loadLoginPage(webView)
    }
}
