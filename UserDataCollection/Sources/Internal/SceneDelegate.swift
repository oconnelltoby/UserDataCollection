//
//  SceneDelegate.swift
//  UserDataCollection
//
//  Created by Toby O'Connell on 27/03/2021.
//

import UIKit
import Scenarios

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        window = UIWindow(windowScene: windowScene)
        let navigationController = UINavigationController()
        ScenarioCoordinator(navigationController: navigationController).start()
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}

