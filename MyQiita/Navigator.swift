//
//  Navigator.swift
//  MyQiita
//
//  Created by ちゅーたつ on 2018/04/09.
//  Copyright © 2018年 ちゅーたつ. All rights reserved.
//

import UIKit

//イニシャライザと一部メソッド, navigatableでnavitagte to 可能
class Navigator {
    var controller: UIViewController
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    enum Style {
        case modal, push, pop, dismiss
    }
}

extension Navigator {
    
    func dismiss() {
        controller.dismiss(animated: true, completion: nil)
    }
}

protocol Navigatable {
    associatedtype DirectionType
    func controller(_ to: DirectionType) -> UIViewController
}

extension Navigatable where Self: Navigator {
    
    func navigate(to: DirectionType, style: Style = .push, animated: Bool = true) {
        let c = controller(to)
        switch style {
        case .modal:
            controller.present(c, animated: animated, completion: nil)
        case .push:
            controller.navigationController?.pushViewController(c, animated: animated)
        case .pop:
            controller.navigationController?.popViewController(animated: animated)
        case .dismiss:
            controller.dismiss(animated: animated, completion: nil)
        }
    }
}
