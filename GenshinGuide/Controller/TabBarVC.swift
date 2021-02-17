//
//  TabBarVC.swift
//  GenshinGuide
//
//  Created by Lucas Fernandes on 10/02/21.
//

import UIKit

class TabBarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let firstVC = UINavigationController(rootViewController: CharVC())
        firstVC.tabBarItem = UITabBarItem(title: "Database", image: UIImage(named: "List"), tag: 0)
        
        let secondVC = UINavigationController(rootViewController: TimerVC())
        secondVC.tabBarItem = UITabBarItem(title: "Timer", image: UIImage(named: "Timer"), tag: 1)
        
//        let thirdVC = UINavigationController(rootViewController: BuilderVC())
//        thirdVC.tabBarItem = UITabBarItem(title: "Team Builder", image: UIImage(named: "book"), tag: 2)
        
        let tabList = [firstVC, secondVC]
        viewControllers = tabList
        setupColor()
    }
    
    func setupColor() {
//        tabBar.tintColor = .detailsTurquoise
//        tabBar.unselectedItemTintColor = .titlesWhite
//        tabBar.barTintColor = .backgroundBlack
//        tabBar.isTranslucent = false
//        //tabBar.backgroundColor = .darkGray
//        //tabBar.isOpaque = true
    }
}
