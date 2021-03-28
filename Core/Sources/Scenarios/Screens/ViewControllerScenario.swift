//
//  ViewControllerScenario.swift
//  
//
//  Created by Toby O'Connell on 28/03/2021.
//

import Interface
import Integration

class ViewControllerScenario: Scenario {
    static let path = Path("Screens", "View Controller")
    static let coordinator: Coordinating = SimpleCoordinator(rootViewController: ViewController())
}
