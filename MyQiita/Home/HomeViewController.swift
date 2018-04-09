//
//  HomeViewController.swift
//  MyQiita
//
//  Created by ちゅーたつ on 2018/04/09.
//  Copyright © 2018年 ちゅーたつ. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        view.backgroundColor = .pink
        let a = ViewController()
        self.addChildViewController(a)
        view.addSubview(a.view)
    }
}
