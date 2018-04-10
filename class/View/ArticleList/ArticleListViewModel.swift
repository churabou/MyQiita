//
//  ArticleListViewModel.swift
//  MyQiita
//
//  Created by ちゅーたつ on 2018/04/09.
//  Copyright © 2018年 ちゅーたつ. All rights reserved.
//

import RxSwift

class ArticleListViewModel {
    
    var isLoading = false
    var articles: Variable<[Article]> = Variable([])
    
    private let perPage = 20
    private var page = 1
    private var target: ArticlePostRequest.Target
    
    init(target: ArticlePostRequest.Target) {
        self.target = target
    }
    
    func fetchArticle() {

        let request = ArticlePostRequest(target, page: page, perPage: perPage)
        QiitaSession.send(request, completion: { response in
            switch response {
            case .success(let articles):
                print(articles)
                self.articles.value = articles
            case .failure(let message):
                print(message)
            }
        })
    }
    
    
    func fetchMoreArticle() {
        
        page += 1
        let request = ArticlePostRequest(target, page: page, perPage: perPage)
        QiitaSession.send(request, completion: { response in
            switch response {
            case .success(let articles):
                self.articles.value += articles
            case .failure(let message):
                print(message)
            }
        })
    }
}
