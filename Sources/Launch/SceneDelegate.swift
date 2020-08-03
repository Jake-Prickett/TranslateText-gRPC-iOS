//
//  SceneDelegate.swift
//  TranslateText-gRPC-iOS
//
//  Created by PRICKETT, JACOB on 7/31/20.
//  Copyright © 2020 Jacob Prickett. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var navController: UINavigationController?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        navController = UINavigationController()
        navController?.navigationBar.backgroundColor = .systemBlue
        navController?.navigationBar.prefersLargeTitles = false

        let viewController: UIViewController = ViewController()
        navController?.pushViewController(viewController, animated: false)

        window = UIWindow(windowScene: windowScene)
        self.window!.rootViewController = navController
        self.window!.backgroundColor = .systemGray
        self.window!.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) { }

    func sceneDidBecomeActive(_ scene: UIScene) { }

    func sceneWillResignActive(_ scene: UIScene) { }

    func sceneWillEnterForeground(_ scene: UIScene) { }

    func sceneDidEnterBackground(_ scene: UIScene) { }
}
