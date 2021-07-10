//
// Copyright © 2021 Toby O'Connell. All rights reserved.
//

import Scenarios
import XCTest

struct LastNameScreenModel {
    var app: XCUIApplication

    var textField: XCUIElement {
        app.textFields[.last_name_textfield_placeholder]
    }

    var heading: XCUIElement {
        app.staticTexts[.last_name_heading]
    }
    
    var button: XCUIElement {
        app.buttons[.last_name_button]
    }
}
