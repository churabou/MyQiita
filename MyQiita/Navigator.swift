//
//  Navigator.swift
//  MyQiita
//
//  Created by ちゅーたつ on 2018/04/09.
//  Copyright © 2018年 ちゅーたつ. All rights reserved.
//

import UIKit

class Navigator {
    var controller: UIViewController
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    enum Style {
        case modal, push, pop
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
    
    func navigate(to: DirectionType, style: Style = .push) {
        let c = controller(to)
        switch style {
        case .modal:
            controller.present(c, animated: true, completion: nil)
        case .push:
            controller.navigationController?.pushViewController(c, animated: true)
        case .pop:
            controller.navigationController?.popViewController(animated: true)
        }
    }
}

