//
//  BaseView.swift
//  MyQiita
//
//  Created by ちゅーたつ on 2018/04/10.
//  Copyright © 2018年 ちゅーたつ. All rights reserved.
//

import UIKit

class BaseView: UIView {
    
    
    private var isConstraintsInitialized = false

    override init(frame: CGRect) {
        super.init(frame: frame)
        initializeView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func updateConstraints() {
        
        if !isConstraintsInitialized {
            initializeConstraints()
            isConstraintsInitialized = true
        }
        initializeConstraints()
        super.updateConstraints()
    }
    func initializeView() {}
    func initializeConstraints() {}
}
