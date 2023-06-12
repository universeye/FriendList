//
//  MainTabbarController.swift
//  FriendList
//
//  Created by Terry Kuo on 2023/6/12.
//

import UIKit

class MainTabbarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBar.appearance().tintColor = FriendListColor.hotPink
        viewControllers = [createProductNavigationController(), createFriendNavigationController(), createHomeNavigationController(), createManageNavigationController(), createSettingNavigationController()]
    }
    
    func createProductNavigationController() -> UINavigationController {
        let productsVC = ProductsViewController()
        productsVC.title = "錢錢"
        productsVC.tabBarItem = UITabBarItem(title: "錢錢", image: Icon.productsIcon, tag: 0)
        return UINavigationController(rootViewController: productsVC)
    }

    
    func createFriendNavigationController() -> UINavigationController {
        let friendVC = FriendsViewController()
        friendVC.title = "朋友"
        friendVC.tabBarItem = UITabBarItem(title: "朋友", image: Icon.friendIcon, tag: 1)
        return UINavigationController(rootViewController: friendVC)
    }
    
    func createHomeNavigationController() -> UINavigationController {
        let homeVC = HomeViewController()
        homeVC.title = "KOKO"
        homeVC.tabBarItem = UITabBarItem(title: nil, image: Icon.kokoHomeIcon, tag: 2)
        return UINavigationController(rootViewController: homeVC)
    }
    
    func createManageNavigationController() -> UINavigationController {
        let manageVC = ManageViewController()
        manageVC.title = "記帳"
        manageVC.tabBarItem = UITabBarItem(title: "記帳", image: Icon.manageIcon, tag: 3)
        return UINavigationController(rootViewController: manageVC)
    }
    
    func createSettingNavigationController() -> UINavigationController {
        let settingsVC = SettingsViewController()
        settingsVC.title = "設定"
        settingsVC.tabBarItem = UITabBarItem(title: "設定", image: UIImage(systemName: "gearshape"), tag: 4)
        return UINavigationController(rootViewController: settingsVC)
    }

}
