//
// Copyright © 2021 Toby O'Connell. All rights reserved.
//

import Scenarios
import XCTest

struct EmailAddressScreenModel {
    var app: XCUIApplication

    var textField: XCUIElement {
        app.textFields[.email_address_textfield_placeholder]
    }

    var heading: XCUIElement {
        app.staticTexts[.email_address_heading]
    }

    var button: XCUIElement {
        app.buttons[.email_address_button]
    }
}
