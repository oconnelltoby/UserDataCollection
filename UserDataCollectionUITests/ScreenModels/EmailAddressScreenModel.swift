//
// Copyright © 2021 Toby O'Connell. All rights reserved.
//

import Scenarios
import XCTest

struct EmailAddressScreenModel {
    var app: XCUIApplication
    
    var title: XCUIElement {
        app.staticTexts[.email_address_title]
    }

    var textField: XCUIElement {
        app.textFields[.email_address_textfield_placeholder]
    }

    var heading: XCUIElement {
        app.staticTexts[.email_address_heading]
    }

    var body: XCUIElement {
        app.staticTexts[.email_address_body]
    }

    var button: XCUIElement {
        app.buttons[.email_address_button]
    }

    func emailAddressInfo(scenario: EmailAddressScreenScenario.Type) -> XCUIElement {
        app.staticTexts[.email_address_info(min: scenario.minLength, max: scenario.maxLength)]
    }

    func alert(text: String, scenario: EmailAddressScreenScenario.Type) -> XCUIElement {
        let alertTitle = scenario.alertTitle(for: text)
        return app.staticTexts[alertTitle]
    }
}
