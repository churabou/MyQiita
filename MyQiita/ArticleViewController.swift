//
//  ArticleViewController.swift
//  MyQiita
//
//  Created by ちゅーたつ on 2018/04/06.
//  Copyright © 2018年 ちゅーたつ. All rights reserved.
//

import UIKit

class ArticleViewController: UIViewController {
    
    var url = ""
    private var webView = UIWebView()
    
    override func viewDidLoad() {
        webView.frame = view.frame
        view.addSubview(webView)
        let request = URLRequest(url: URL(string: url)!)
        webView.loadRequest(request)
    }
}
