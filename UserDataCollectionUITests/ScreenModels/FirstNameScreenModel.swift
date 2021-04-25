//
// Copyright © 2021 Toby O'Connell. All rights reserved.
//

import Scenarios
import XCTest

struct FirstNameScreenModel {
    var app: XCUIApplication
    
    var title: XCUIElement {
        app.staticTexts[.first_name_title]
    }

    var textField: XCUIElement {
        app.textFields[.first_name_textfield_placeholder]
    }

    var heading: XCUIElement {
        app.staticTexts[.first_name_heading]
    }

    var body: XCUIElement {
        app.staticTexts[.first_name_body]
    }

    var button: XCUIElement {
        app.buttons[.first_name_button]
    }

    func firstNameInfo(scenario: FirstNameScreenScenario.Type) -> XCUIElement {
        app.staticTexts[.first_name_info(min: scenario.minLength, max: scenario.maxLength)]
    }

    func alert(text: String, scenario: FirstNameScreenScenario.Type) -> XCUIElement {
        let alertTitle = scenario.alertTitle(for: text)
        return app.staticTexts[alertTitle]
    }
}
