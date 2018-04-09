//
//  LoginViewModel.swift
//  MyQiita
//
//  Created by ちゅーたつ on 2018/04/08.
//  Copyright © 2018年 ちゅーたつ. All rights reserved.
//

import UIKit

class AuthViewModel: NSObject {
    
    private var navigator: AuthViewNavigator?
    
    convenience init(_ navigator: AuthViewNavigator) {
        self.init()
        self.navigator = navigator
    }
    
    fileprivate let endpoint = "https://qiita.com/api/v2/oauth/authorize"

    func loadLoginPage(_ webView: UIWebView) {

        guard var urlComponents = URLComponents(string: endpoint) else {
            return
        }
        
        urlComponents.queryItems = [
            URLQueryItem(name: "client_id", value: Config.clientId),
            URLQueryItem(name: "scope", value: "read_qiita")
        ]
        webView.loadRequest(URLRequest(url: urlComponents.url!))
    }
    
    func getToken(code: String) {
        
        let request = AccessTokenPostRequest(code: code)
        QiitaSession.send(request) { (response) in
            switch response {
            case .success(let token):
                Config.accessToken = token
                self.navigator?.navigate(.home)
            case .failure(let message):
                print("失敗した。\(message)")
            }
        }
    }
}

extension AuthViewModel: UIWebViewDelegate {
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        
        guard let url = request.url else {
            return false
        }
        //http://churabou/qiita_client?code=xxxx
        //各自指定したURLで絞り込み
        url.dump()
        
        if url.host == "churabou" && url.lastPathComponent == "qiita_client" {
            
            let code = url.absoluteString.split(separator: "=")[1]
            print(code)
            getToken(code: String(code))
        }
        return true
    }
}


extension URL {
    
    func dump() {
        print("scheme: \(String(describing: scheme))")
        print("host: \(String(describing: host))")
        print("path: \(path)")
        print("lastPathComponent: \(lastPathComponent)")
        print("lastPathComponent: \(self.pathComponents)")
    }
}
