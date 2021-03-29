//
//  PrimaryButton.swift
//  
//
//  Created by Toby O'Connell on 29/03/2021.
//

import Integration
import Interface
import UIKit

class PrimaryButtonScenario: Scenario {
    static var path = Path("Components", "Primary Button")
    
    static var coordinator: Coordinating {
        let contentProvider = [
            UIButton().styleAsPrimary().addTitle("Primary Button"),
        ]
        let viewController = ContentViewController(contentProvider: contentProvider)
        return SimpleCoordinator(rootViewController: viewController)
    }
}
