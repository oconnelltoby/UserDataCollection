//
// Copyright © 2021 Toby O'Connell. All rights reserved.
//

import Scenarios
import XCTest

struct TextFieldModel {
    var app: XCUIApplication

    var placeholderTextField: XCUIElement {
        app.textFields[TextFieldScenario.placeholder]
    }

    var textField: XCUIElement {
        app.textFields[TextFieldScenario.text]
    }
}
