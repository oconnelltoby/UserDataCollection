//
//  SimpleCoordinator.swift
//
//
//  Created by Toby O'Connell on 28/03/2021.
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
