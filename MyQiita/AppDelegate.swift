//
//  AppDelegate.swift
//  MyQiita
//
//  Created by ちゅーたつ on 2018/04/05.
//  Copyright © 2018年 ちゅーたつ. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let c = false ? ViewController() : LoginController()
        window?.rootViewController = UINavigationController(rootViewController: c)
        window?.makeKeyAndVisible()
        
        UINavigationBar.appearance().backgroundColor = .pink
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.darkGray]
        return true
    }
}

