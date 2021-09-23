//
//  MainTabViewController.swift
//  ScrollView-SnapKit-Sample
//
//  Created by Yus Inoue on 2021/09/23.
//

import UIKit

final class MainTabViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        let verticalViewController: UIViewController = {
            let viewController = VerticalViewController()
            viewController.tabBarItem = UITabBarItem(title: "縦スクロール", image: UIImage(), tag: 0)
            
            let navigationController = UINavigationController(rootViewController: viewController)
            navigationController.navigationBar.isTranslucent = false
            return navigationController
        }()
        
        let horizontalViewController: UIViewController = {
            let viewController = HorizontalViewController()
            viewController.tabBarItem = UITabBarItem(title: "横スクロール", image: UIImage(), tag: 0)
            
            let navigationController = UINavigationController(rootViewController: viewController)
            navigationController.navigationBar.isTranslucent = false
            return navigationController
        }()
        
        setViewControllers([verticalViewController, horizontalViewController,], animated: false)
    }
}
