//
// Copyright © 2021 Toby O'Connell. All rights reserved.
//

import Scenarios
import TestSupport
import XCTest

class FirstNameScreenTests: XCTestCase {
    func testBasics() {
        let scenario = FirstNameSuccessScreenScenario.self
        launch(scenario: scenario) { app in
            let model = FirstNameScreenModel(app: app)
            model.title.assertExists()
            model.textField.assertExists()
            model.heading.assertExists()
            model.body.assertExists()
            model.button.assertExists()
            model.firstNameInfo(scenario: scenario).assertExists()
        }
    }

    func testButtonSubmitsText() {
        let scenario = FirstNameSuccessScreenScenario.self
        launch(scenario: scenario) { app in
            let model = FirstNameScreenModel(app: app)
            let text = String.random()
            model.textField.tap()
            model.textField.typeText(text)
            model.button.tap()
            model.alert(text: text, scenario: scenario).assertExists()
        }
    }

    func testTextFieldLimitsLength() {
        let scenario = FirstNameSuccessScreenScenario.self
        launch(scenario: scenario) { app in
            let model = FirstNameScreenModel(app: app)
            let maxLength = Int(scenario.maxLength)
            let text = String.random(length: maxLength + 1)

            model.textField.tap()
            model.textField.typeText(text)
            app.textFields[text].assertDoesNotExist()
            app.textFields[String(text.prefix(maxLength))].assertExists()
        }
    }
}
