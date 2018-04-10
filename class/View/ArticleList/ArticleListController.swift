//
//  ViewController.swift
//  MyQiita
//
//  Created by ちゅーたつ on 2018/04/05.
//  Copyright © 2018年 ちゅーたつ. All rights reserved.
//

import UIKit
import RxSwift

class ArticleListController: UIViewController {

    convenience init(target: ArticlePostRequest.Target) {
        self.init(nibName: nil, bundle: nil)
        self.viewModel = ArticleListViewModel(target: target)
    }
    
    private var tableView = UITableView()
    fileprivate var viewModel = ArticleListViewModel(target: .new)
    private let bag: DisposeBag = DisposeBag()
    
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

        configureObserver()
        viewModel.fetchArticle()
    }
    
    func configureObserver() {
        
        viewModel.articles.asObservable().subscribe(onNext: { _ in
            self.tableView.reloadData()
        }).disposed(by: bag)
        
        tableView.rx.reachedBottom.subscribe(onNext: { _ in
            self.viewModel.fetchMoreArticle()
        }).disposed(by: bag)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        print("これは呼ばれrない")
    }
}

extension ArticleListController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ArticleTableViewCell.height
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let c = ArticleViewController()
        c.body = viewModel.articles.value[indexPath.row].body
        navigationController?.pushViewController(c, animated: true)
    }
}

extension ArticleListController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ArticleTableViewCell else {
            return UITableViewCell()
        }
        
        let article = viewModel.articles.value[indexPath.row]
        cell.configure(article: article)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  viewModel.articles.value.count
    }
}






