//
//  ViewController.swift
//  Unspash
//
//  Created by Кирилл on 18.11.2022.
//

import UIKit

class TabBarController: UITabBarController {

    // Setup main module

    private let main = MainRouter.createModule()
    private let mainTabBarItem = UITabBarItem(title: "Main",
                                              image: UIImage(systemName: "photo.stack"),
                                              selectedImage: UIImage(systemName: "photo.stack.fill"))

    // Setup favorite module

    private let favorite = FavoriteRouter.createModule()
    private let favoriteTabBarItem = UITabBarItem(title: "Favorite",
                                                  image: UIImage(systemName: "heart.fill"),
                                                  selectedImage: UIImage(systemName: "heart"))
    
    var currentNavigationController: UINavigationController {
                TabBarController().viewControllers?[TabBarController().selectedIndex] as! UINavigationController
            }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTabBar()
    }

    private final func setupTabBar() {
        
        
        // Set tab bar items
        main.tabBarItem = mainTabBarItem
        favorite.tabBarItem = favoriteTabBarItem

        // Add view controllers to tab bar controller
        self.viewControllers = [main, favorite].map { UINavigationController(rootViewController: $0) }

        // Customize tab bar
        tabBar.isTranslucent = false
        tabBar.backgroundColor = .white
    }

}
