//
//  TabViewController.swift
//  MyQiita
//
//  Created by ちゅーたつ on 2018/04/10.
//  Copyright © 2018年 ちゅーたつ. All rights reserved.
//

import SnapKit

class TabViewController: UIViewController {
    
    fileprivate var tabItems: [(title: String, controller: UIViewController)] = [
        ("新着", ArticleListController(target: .new)),
        ("フォロー", ArticleListController(target: .userPost)),
        ("ストック", ArticleListController(target: .userStock))
    ]
    
    fileprivate var tabButtons: [UIButton] = []
    fileprivate var childeViews: [UIView] = []
    
    fileprivate var tabView = UIScrollView()
    fileprivate lazy var containerView: UIScrollView = {
        let v = UIScrollView()
        v.backgroundColor = .clear
        v.isPagingEnabled = true
        v.delegate = self
        return v
    }()
    fileprivate lazy var tabBar: UIView = {
        let v = UIView()
        v.backgroundColor = .pink
        return v
    }()
    
    @objc fileprivate func actionButton(_ sender: UIButton) {
        scroll(to: sender.tag)
    }
    
    func initializeConstraints() {
        
        tabView.snp.makeConstraints { (make) in
            make.top.width.equalToSuperview()
            make.height.equalTo(30)
        }
        
        tabBar.snp.makeConstraints { (make) in
            make.top.equalTo(tabView.snp.bottom)
            make.left.equalToSuperview()
            make.width.equalToSuperview().dividedBy(3)
            make.height.equalTo(5)
        }
        
        containerView.snp.makeConstraints { (make) in
            make.top.equalTo(tabBar.snp.bottom)
            make.width.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    
    
    func setItem() {
        
        tabItems.enumerated().forEach { index, item in
            let b = UIButton()
            b.setTitle(item.title, for: .normal)
            b.setTitleColor(.black, for: .normal)
            b.tag = index
            b.addTarget(self, action: #selector(actionButton), for: .touchUpInside)
            tabButtons.append(b)
            tabView.addSubview(b)
            
            
            let v = item.controller.view!
            v.setAutolayout()
            childeViews.append(v)
            containerView.addSubview(v)
            addChildViewController(item.controller)
        }
    }
    
    func updateConstraints() {
        
        tabButtons.enumerated().forEach { index, button in
            
            button.snp.makeConstraints { (make) in
                make.top.bottom.equalToSuperview()
                make.width.equalToSuperview().dividedBy(3)
                
                if button == tabButtons.first {
                    make.left.equalToSuperview()
                } else {
                    let pre = tabButtons[index-1]
                    make.left.equalTo(pre.snp.right)
                }
                
                if button == tabButtons.last {
                    make.right.equalToSuperview()
                }
            }
        }
        
        childeViews.enumerated().forEach { index, view in
            view.snp.makeConstraints { (make) in
                make.top.equalToSuperview()
                make.width.height.equalToSuperview()
                
                if view == childeViews.first {
                    // 最初のViewはUIScrollViewの左側に設定する
                    make.left.equalToSuperview()
                } else {
                    let pre = childeViews[index-1]
                    make.left.equalTo(pre.snp.right)
                }
                // 最後のViewはUIScrollViewの右側に設定する
                if view == childeViews.last {
                    make.right.equalToSuperview()
                }
            }
        }
    }
    
    override func viewDidLoad() {
        
        navigationController?.navigationBar.isTranslucent = false
        title = "qiita client"
        view.backgroundColor = .white
        view.addSubview(tabView)
        view.addSubview(tabBar)
        view.addSubview(containerView)
        
        
        initializeConstraints()
        setItem()
        updateConstraints()
    }
    
    
    func scroll(to: Int) {
        
        let x = CGFloat(to) * containerView.bounds.width
        UIView.animate(withDuration: 0.3) {
            
            self.containerView.contentOffset.x = x
        }
    }
    
    fileprivate var currentIndex: Int {
        
        return Int(containerView.contentOffset.x / containerView.bounds.width)
    }
}


extension TabViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        tabBar.frame.origin.x = scrollView.contentOffset.x / CGFloat(tabItems.count)
    }
}
