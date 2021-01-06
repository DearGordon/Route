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
        window.makeKeyAndVisible()
        window.backgroundColor = .white
        window.rootViewController = MainTabBarVC()
        self.window = window
    }

}
