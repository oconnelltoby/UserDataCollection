//
//  ScenarioCoordinator.swift
//
//
//  Created by Toby O'Connell on 28/03/2021.
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
