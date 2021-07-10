//
// Copyright © 2021 Toby O'Connell. All rights reserved.
//

import Scenarios
import XCTest

struct FirstNameScreenModel {
    var app: XCUIApplication
    
    var textField: XCUIElement {
        app.textFields[.first_name_textfield_placeholder]
    }
    
    var button: XCUIElement {
        app.buttons[.first_name_button]
    }
}
