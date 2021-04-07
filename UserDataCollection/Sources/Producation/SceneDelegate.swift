//
// Copyright © 2021 Toby O'Connell. All rights reserved.
//

import Integration
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    private let appController = AppController()

    func scene(_ scene: UIScene, willConnectTo _: UISceneSession, options _: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        window = UIWindow(windowScene: windowScene)
        appController.start()
        window?.rootViewController = appController.rootViewController
        window?.makeKeyAndVisible()
    }
}
