//
//  MainTabBarVC.swift
//  Route
//
//  Created by Nick on 1/7/21.
//

import UIKit

enum Size: String, CaseIterable {
    case xs
    case s
    case m
    case l
    case xl
    case xxl
}

final class MainTabBarVC: UITabBarController {

    private let coatNav: UINavigationController = UINavigationController(rootViewController: TextViewController(title: "BASE"))
    private let pantsNav: UINavigationController = UINavigationController(rootViewController: TextViewController(title: "BASE"))
    private let hatNav: UINavigationController = UINavigationController(rootViewController: TextViewController(title: "BASE"))
    private let testNav: UINavigationController = UINavigationController(rootViewController: TestViewController())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        coatNav.tabBarItem = UITabBarItem(title: "coat", image: UIImage.image(with: .blue), selectedImage: UIImage.image(with: .red))
        pantsNav.tabBarItem = UITabBarItem(title: "pants", image: UIImage.image(with: .blue), selectedImage: UIImage.image(with: .red))
        hatNav.tabBarItem = UITabBarItem(title: "hat", image: UIImage.image(with: .blue), selectedImage: UIImage.image(with: .red))
        testNav.tabBarItem = UITabBarItem(title: "test", image: UIImage.image(with: .blue), selectedImage: UIImage.image(with: .red))
        setViewControllers([testNav, coatNav, pantsNav, hatNav], animated: false)
    }
    
}

