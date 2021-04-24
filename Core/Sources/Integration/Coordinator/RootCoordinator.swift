//
// Copyright © 2021 Toby O'Connell. All rights reserved.
//

import Interface
import UIKit

struct RootCoordinator: Coordinating {
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        navigationController.pushViewController(UIViewController(), animated: false)
    }
}
