//
// Copyright © 2021 Toby O'Connell. All rights reserved.
//

import Integration
import Interface

class FirstNameScreenScenario: Scenario {
    static let path = Path("Prototype Screens", "First Name")
    static let coordinator: Coordinating = SimpleCoordinator(rootViewController: FirstNameViewController())
}
