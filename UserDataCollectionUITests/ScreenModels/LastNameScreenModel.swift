//
// Copyright © 2021 Toby O'Connell. All rights reserved.
//

import Scenarios
import XCTest

struct LastNameScreenModel {
    var app: XCUIApplication
    
    var title: XCUIElement {
        app.staticTexts[.last_name_title]
    }

    var textField: XCUIElement {
        app.textFields[.last_name_textfield_placeholder]
    }

    var heading: XCUIElement {
        app.staticTexts[.last_name_heading]
    }

    var body: XCUIElement {
        app.staticTexts[.last_name_body]
    }

    var button: XCUIElement {
        app.buttons[.last_name_button]
    }

    func lastNameInfo(scenario: LastNameScreenScenario.Type) -> XCUIElement {
        app.staticTexts[.last_name_info(min: scenario.minLength, max: scenario.maxLength)]
    }

    func alert(text: String, scenario: LastNameScreenScenario.Type) -> XCUIElement {
        let alertTitle = scenario.alertTitle(for: text)
        return app.staticTexts[alertTitle]
    }
}
