//
//  HomeViewController.swift
//  MyQiita
//
//  Created by ちゅーたつ on 2018/04/09.
//  Copyright © 2018年 ちゅーたつ. All rights reserved.
//

import SnapKit


extension UIView {
    
    func setAutolayout() {
        translatesAutoresizingMaskIntoConstraints = false
    }
}

class HomeViewController: UIViewController {
    
    fileprivate var tabItems: [(title: String, controller: UIViewController)] = [
        ("新着", ArticleListController()),
        ("フォロー", UIViewController()),
        ("ストック", UIViewController())
    ]

    fileprivate var tabView = UIScrollView()
    fileprivate var containerView = UIScrollView()
    fileprivate var tabButtons: [UIButton] = []
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    func initializeConstraints() {
        
        tabView.snp.makeConstraints { (make) in
            make.top.width.equalToSuperview()
            make.height.equalTo(50)
        }
        
        containerView.snp.makeConstraints { (make) in
            make.top.equalTo(tabView.snp.bottom).offset(5)
            make.width.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    fileprivate var childeViews: [UIView] = []
    
    func setItem() {

        tabItems.enumerated().forEach { index, item in
            let b = UIButton()
            b.setTitle(item.title, for: .normal)
            b.setTitleColor(.black, for: .normal)
            tabButtons.append(b)
            tabView.addSubview(b)
            
            let v = UIView()
            v.backgroundColor = index == 1 ? .red : .blue
            childeViews.append(v)
            containerView.addSubview(v)
            v.setAutolayout()
        }

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
        
        var preView: UIView?
        for view in childeViews {
            view.snp.makeConstraints({ (make) in
                make.top.equalToSuperview()
                make.width.height.equalToSuperview()
                
                if let pre = preView {
                    make.left.equalTo(pre.snp.right)
                } else {
                    // 最初のViewはUIScrollViewの左側に設定する
                    make.left.equalToSuperview()
                }
                // 最後のViewはUIScrollViewの右側に設定する
                if view == childeViews.last {
                    make.right.equalToSuperview()
                }
                preView = view
            })
        }
    }
    
    override func viewDidLoad() {
        view.backgroundColor = .pink

        tabView.setAutolayout()
        tabView.backgroundColor = .red
        view.addSubview(tabView)
        
        containerView.setAutolayout()
        containerView.backgroundColor = .green
        view.addSubview(containerView)
        initializeConstraints()
        setItem()
    }
    

}
