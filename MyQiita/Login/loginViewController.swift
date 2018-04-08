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
    private var viewModel = LoginViewModel()
    
    override func viewDidLoad() {
        webView.delegate = viewModel
        view.addSubview(webView)
        
        webView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        viewModel.loadLoginPage(webView)
    }
}


