//
//  ViewControllerScenario.swift
//
//
//  Created by Toby O'Connell on 28/03/2021.
//

import Integration
import Interface

class ViewControllerScenario: Scenario {
    static let path = Path("Screens", "View Controller")
    static let coordinator: Coordinating = SimpleCoordinator(rootViewController: ViewController())
}
