//
//  SceneDelegate.swift
//  Route
//
//  Created by Nick on 1/6/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {

        guard let scene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: scene)
        let tab = MainTabBarVC()
        window.makeKeyAndVisible()
        window.backgroundColor = .white
        window.rootViewController = tab
        self.window = window
        addRoute(tab: tab)
    }

    func addRoute(tab: MainTabBarVC) {
        let route = NLRoute.shared
        
        route.addRoute(pattern: "coat/:size") { [weak tab] para, add in
            guard let tab = tab else { return false }
            guard let size = para["size"] else { return false }
            tab.selectedIndex = 1
            let nav = (tab.selectedViewController as? UINavigationController)
            nav?.popToRootViewController(animated: false)
            let nextVC = TextViewController(title: size)
            nav?.pushViewController(nextVC, animated: true)
            return true
        }
        
        route.addRoute(pattern: "pants/:size") { [weak tab] para, add in
            guard let tab = tab else { return false }
            guard let size = para["size"] else { return false }
            tab.selectedIndex = 2
            let nav = (tab.selectedViewController as? UINavigationController)
            nav?.popToRootViewController(animated: false)
            let nextVC = TextViewController(title: size)
            nav?.pushViewController(nextVC, animated: true)
            return true
        }
    }
    
}
