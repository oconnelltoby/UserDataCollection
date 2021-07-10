//
// Copyright © 2021 Toby O'Connell. All rights reserved.
//

import Scenarios
import XCTest

struct SingleFieldScreenModel {
    var app: XCUIApplication
    var scenario: SingleFieldSuccessScreenScenario.Type
    
    var title: XCUIElement {
        app.staticTexts[scenario.title]
    }
    
    var heading: XCUIElement {
        app.staticTexts[scenario.heading]
    }
    
    var body: XCUIElement {
        app.staticTexts[scenario.body]
    }
    
    var info: XCUIElement {
        app.staticTexts[scenario.info]
    }
    
    var textField: XCUIElement {
        app.textFields[scenario.textField]
    }
    
    var button: XCUIElement {
        app.buttons[scenario.button]
    }
    
    func alert(for input: String) -> XCUIElement {
        app.staticTexts[scenario.alertTitle(for: input)]
    }
}
