//
// Copyright © 2021 Toby O'Connell. All rights reserved.
//

import Integration
import UIKit

class ScenarioCoordinator: Coordinating {
    var navigationController: UINavigationController
    private let viewController = ScenarioWrappingViewController()

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func updateContent() {
        viewController.updateContent()
    }

    func start() {
        navigationController.pushViewController(viewController, animated: false)
    }
}
