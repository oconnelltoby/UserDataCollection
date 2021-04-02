//
//  SceneDelegate.swift
//  UserDataCollection
//
//  Created by Toby O'Connell on 27/03/2021.
//

import UIKit
import Integration

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    private let appController = AppController()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        window = UIWindow(windowScene: windowScene)
        appController.start()
        window?.rootViewController = appController.rootViewController
        window?.makeKeyAndVisible()
    }
}

