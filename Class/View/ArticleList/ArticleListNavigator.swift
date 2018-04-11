//
//  ArticleListNavigator.swift
//  MyQiita
//
//  Created by ちゅーたつ on 2018/04/11.
//  Copyright © 2018年 ちゅーたつ. All rights reserved.
//

import UIKit

class ArticleListNavigator: Navigator, Navigatable {
    
    typealias DirectionType = Direction
    enum Direction {
        case detaile(article: Article)
    }

    func controller(_ to: Direction) -> UIViewController {
        
        switch to {
        case .detaile(let article):
            return ArticleDetailViewController(article: article)
        }
    }
}
