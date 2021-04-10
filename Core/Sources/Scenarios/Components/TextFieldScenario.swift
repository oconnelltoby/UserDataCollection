//
// Copyright © 2021 Toby O'Connell. All rights reserved.
//

import Integration
import Interface
import UIKit

public class TextFieldScenario: Scenario {
    public static var path = Path("Components", "Text Field")
    public static let placeholder = "Placeholder"
    public static let text = "Initial Text"

    public static var coordinator: Coordinating {
        let textField1 = TextField(placeholder: "Placeholder")
        let textField2 = TextField(text: "Initial Text")
        let viewController = ContentViewController(contentProvider: [textField1, textField2])
        return SimpleCoordinator(rootViewController: viewController)
    }
}
