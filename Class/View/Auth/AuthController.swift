//
//  AuthController.swift
//  MyQiita
//
//  Created by ちゅーたつ on 2018/04/08.
//  Copyright © 2018年 ちゅーたつ. All rights reserved.
//

import SnapKit
//webViewについて深く理解していなので？とにかくコード量が増えるだけなのでAuthViewは作らない。
class AuthController: UIViewController {
    
    private var webView = UIWebView()
    private var viewModel: AuthViewModel!
    private var navigator: AuthViewNavigator!
    
    override func viewDidLoad() {

        navigator = AuthViewNavigator(controller: self)
        viewModel = AuthViewModel(navigator)
        webView.delegate = self
        view.addSubview(webView)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        webView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    //Todo: 呼ばれなかった。modalだと呼ばれないのか、あとで原因調べて学習する。
    override func updateViewConstraints() {
        webView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        super.updateViewConstraints()
    }

    override func viewDidAppear(_ animated: Bool) {
        webView.loadRequest(viewModel.loginPageRequest())
    }
}


extension AuthController: UIWebViewDelegate {
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        return viewModel.handleRedirect(request: request)
    }
}
