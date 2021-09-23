//
//  AppDelegate.swift
//  ScrollView-SnapKit-Sample
//
//  Created by Yus Inoue on 2021/09/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        UINavigationBar.appearance().barTintColor = .white
        UINavigationBar.appearance().isTranslucent = false
        
        UITabBar.appearance().barTintColor = .white
        UITabBar.appearance().isTranslucent = false
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window!.rootViewController = MainTabViewController()
        window!.makeKeyAndVisible()
        return true
    }
}
