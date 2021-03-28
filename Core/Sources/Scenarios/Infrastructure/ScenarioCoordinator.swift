//
//  ScenarioCoordinator.swift
//  
//
//  Created by Toby O'Connell on 28/03/2021.
//

import Integration
import UIKit

public class ScenarioCoordinator: Coordinating {
    public var navigationController: UINavigationController
    
    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    public func start() {
        let viewController = ScenarioWrappingViewController()
        navigationController.pushViewController(viewController, animated: false)
    }
}
