//
//  ViewController.swift
//  InRoad
//
//  Created by Dinmukhamed on 18.02.2023.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        generateTabBar()
        setTabBarAppearance()
    }
    private func generateTabBar(){
        viewControllers = [
            generateVC(viewController: HomeViewController(),
                       title: "Карта",
                       image: UIImage(named: "Map")),
            generateVC(viewController: SettingsViewController(),
                       title: "Настройки",
                       image: UIImage(named: "Settings"))
        ]
    }
//    private func generateVC(viewController: UIViewController, title: String, image: UIImage?) -> UINavigationController{
//        viewController.tabBarItem.title = title
//        viewController.tabBarItem.image = image
//        let navController = UINavigationController(rootViewController: viewController)
//        return navController
//    }
    private func generateVC(viewController: UIViewController, title: String, image: UIImage?) -> UIViewController{
            viewController.tabBarItem.title = title
            viewController.tabBarItem.image = image
            return viewController
        }
    private func setTabBarAppearance(){
        tabBar.tintColor = .tabBarItemAccent
        tabBar.backgroundColor = .white
    }

}

