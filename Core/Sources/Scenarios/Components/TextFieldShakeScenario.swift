//
// Copyright © 2021 Toby O'Connell. All rights reserved.
//

import Integration
import Interface
import UIKit

public class TextFieldShakeScenario: Scenario {
    public static var path = Path("Components", "Text Field Shake")

    public static var coordinator: Coordinating {
        SimpleCoordinator(rootViewController: ViewController())
    }
}

private class ViewController: UIViewController {
    override func loadView() {
        let textField = TextField(placeholder: "Invalid Text")
        textField.errorState = .error
        let button = UIButton().addTitle("Shake").styleAsPrimary().addAction {
            textField.shake()
        }
        view = TemplateView(scrolling: [textField], footer: [button])
    }
}
