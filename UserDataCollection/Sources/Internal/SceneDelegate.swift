//
// Copyright © 2021 Toby O'Connell. All rights reserved.
//

import Scenarios
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    private let appController = ScenarioAppController()

    func scene(_ scene: UIScene, willConnectTo _: UISceneSession, options _: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        window = UIWindow(windowScene: windowScene)
        appController.start()
        window?.rootViewController = appController.rootViewController
        window?.makeKeyAndVisible()
    }

    func windowScene(_: UIWindowScene, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
        let success = appController.performAction(for: shortcutItem)
        completionHandler(success)
    }
}
