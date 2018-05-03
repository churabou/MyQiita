//
//  HomeViewController.swift
//  MyQiita
//
//  Created by ちゅーたつ on 2018/04/09.
//  Copyright © 2018年 ちゅーたつ. All rights reserved.
//

import UIKit


extension UIView {
    
    func setAutolayout() {
        translatesAutoresizingMaskIntoConstraints = false
    }
}


class HomeViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tabController = UINavigationController(rootViewController: TabViewController())
        tabController.tabBarItem = UITabBarItem(title: "記事",
                                                image: UIImage(named: ""),
                                                selectedImage: UIImage(named: ""))
        
        let profileController = ProfileViewController()
        profileController.tabBarItem = UITabBarItem(title: "プロフィール",
                                                    image: UIImage(named: ""),
                                                    selectedImage: UIImage(named: ""))
        
        setViewControllers([tabController, profileController], animated: false)
    }
}


