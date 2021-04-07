//
// Copyright © 2021 Toby O'Connell. All rights reserved.
//

import Integration
import UIKit

class SimpleCoordinator: Coordinating {
    let navigationController = UINavigationController()

    private var rootViewController: UIViewController

    init(rootViewController: UIViewController) {
        self.rootViewController = rootViewController
    }

    func start() {
        navigationController.pushViewController(rootViewController, animated: false)
    }
}
