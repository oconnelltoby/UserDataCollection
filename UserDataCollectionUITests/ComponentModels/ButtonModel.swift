//
// Copyright © 2021 Toby O'Connell. All rights reserved.
//

import Scenarios
import XCTest

struct ButtonModel {
    var app: XCUIApplication

    var primaryButton: XCUIElement {
        app.staticTexts[ButtonScenario.primaryButtonTitle]
    }

    var primaryButtonAlertTitle: XCUIElement {
        app.staticTexts[ButtonScenario.primaryButtonAlertTitle]
    }

    var secondaryButton: XCUIElement {
        app.staticTexts[ButtonScenario.secondaryButtonTitle]
    }

    var secondaryButtonAlertTitle: XCUIElement {
        app.staticTexts[ButtonScenario.secondaryButtonAlertTitle]
    }
}
