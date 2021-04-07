//
// Copyright © 2021 Toby O'Connell. All rights reserved.
//

import Integration
import Interface

class ViewControllerScenario: Scenario {
    static let path = Path("Screens", "View Controller")
    static let coordinator: Coordinating = SimpleCoordinator(rootViewController: ViewController())
}
