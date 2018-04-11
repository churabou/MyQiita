//
//  ArticleViewController.swift
//  MyQiita
//
//  Created by ちゅーたつ on 2018/04/06.
//  Copyright © 2018年 ちゅーたつ. All rights reserved.
//

import UIKit

class ArticleDetailViewController: UIViewController {
    
    var url = ""
    var body = ""
    private var webView = UIWebView()
    
    override func viewDidLoad() {
        webView.frame = view.frame
        webView.delegate = self
        view.addSubview(webView)
        let url = Bundle.main.url(forResource: "hello", withExtension: "html")
        let request = URLRequest(url: url!)
        webView.loadRequest(request)
    }
}

extension ArticleDetailViewController: UIWebViewDelegate {
    
    func webViewDidFinishLoad(_ webView: UIWebView) {

        print(body)
        let md = "# 日本語であそぼ\n ##aaa"
        let js = "draw('\(md)'));"
        self.webView.stringByEvaluatingJavaScript(from: js)
    }
}
