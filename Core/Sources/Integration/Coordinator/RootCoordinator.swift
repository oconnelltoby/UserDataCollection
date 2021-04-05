//
//  RootCoordinator.swift
//
//
//  Created by Toby O'Connell on 27/03/2021.
//

import Interface
import UIKit

struct RootCoordinator: Coordinating {
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        navigationController.pushViewController(ViewController(), animated: false)
    }
}
