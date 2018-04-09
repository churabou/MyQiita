//
//  ArticleListViewModel.swift
//  MyQiita
//
//  Created by ちゅーたつ on 2018/04/09.
//  Copyright © 2018年 ちゅーたつ. All rights reserved.
//

import Foundation


class ArticleListViewModel {
    
    var isLoading = false
    var articles: [Article] = []
    
    func fetchArticle() {

        QiitaSession.send(ArticlePostRequest(), completion: { response in
            switch response {
            case .success(let articles):
                print(articles)
                self.articles = articles
//                DispatchQueue.main.async {
//                    self.tableView.reloadData()
//                }
            case .failure(let message):
                print(message)
            }
        })
    }
}
