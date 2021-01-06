//
//  AppDelegate.swift
//  Route
//
//  Created by Nick on 1/6/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        UITabBar.appearance().tintColor = .red
        UITabBar.appearance().unselectedItemTintColor = .blue

        return true
    }

}
