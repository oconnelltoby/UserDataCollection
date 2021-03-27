//
//  RootCoordinator.swift
//
//
//  Created by Toby O'Connell on 27/03/2021.
//

import Interface
import UIKit

public struct RootCoordinator: Coordinating {
    public var navigationController: UINavigationController
    
    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    public func start() {
        navigationController.pushViewController(ViewController(), animated: false)
    }
}
