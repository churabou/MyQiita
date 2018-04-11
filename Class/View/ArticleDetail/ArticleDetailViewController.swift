//
//  ArticleViewController.swift
//  MyQiita
//
//  Created by ちゅーたつ on 2018/04/06.
//  Copyright © 2018年 ちゅーたつ. All rights reserved.
//

import UIKit

class ArticleDetailViewController: UIViewController {
    
    convenience init(article: Article) {
        self.init(nibName: nil, bundle: nil)
        self.article = article
    }

    fileprivate var article: Article?
    fileprivate var webView = UIWebView()
    
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

        print(article?.body)
        print("呼ばれてはいる")
        let md = "# invalid charactor aaa  \\n ### next column"
        let js = "draw('\(md)');"
        self.webView.stringByEvaluatingJavaScript(from: js)
    }
}
