//
//  ViewController.swift
//  MyQiita
//
//  Created by ちゅーたつ on 2018/04/05.
//  Copyright © 2018年 ちゅーたつ. All rights reserved.
//

import UIKit

class ArticleListController: UIViewController {

    private var tableView = UITableView()
    fileprivate var articles: [Article] = []
    fileprivate var viewModel = ArticleListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "記事一覧"
        setUpTableView: do {
            tableView.frame = view.frame
            tableView.dataSource = self
            tableView.delegate = self
            tableView.register(ArticleTableViewCell.self, forCellReuseIdentifier: "cell")
            view.addSubview(tableView)
        }
        
        viewModel.fetchArticle()
    }
}

extension ArticleListController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ArticleTableViewCell.height
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let c = ArticleViewController()
        c.body = articles[indexPath.row].body
        navigationController?.pushViewController(c, animated: true)
    }
}

extension ArticleListController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ArticleTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(article: articles[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
}






