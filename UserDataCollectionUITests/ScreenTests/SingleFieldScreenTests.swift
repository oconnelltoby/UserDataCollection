//
// Copyright © 2021 Toby O'Connell. All rights reserved.
//

import Scenarios
import TestSupport
import XCTest

class SingleFieldScreenTests: XCTestCase {
    func testBasics() {
        let scenario = SingleFieldSuccessScreenScenario.self
        launch(scenario: scenario) { app in
            let model = SingleFieldScreenModel(app: app, scenario: scenario)
            model.title.assertExists()
            model.textField.assertExists()
            model.heading.assertExists()
            model.body.assertExists()
            model.button.assertExists()
            model.info.assertExists()
        }
    }

    func testButtonSubmitsText() {
        let scenario = SingleFieldSuccessScreenScenario.self
        launch(scenario: scenario) { app in
            let model = SingleFieldScreenModel(app: app, scenario: scenario)
            model.textField.tap()
            model.textField.typeText(scenario.input)
            model.button.tap()
            model.alert(for: scenario.input).assertExists()
        }
    }

    func testTextFieldLimitsLength() {
        let scenario = SingleFieldSuccessScreenScenario.self
        launch(scenario: scenario) { app in
            let model = SingleFieldScreenModel(app: app, scenario: scenario)
            let maxLength = Int(scenario.maxLength)
            let text = String.random(length: maxLength + 1)

            model.textField.tap()
            model.textField.typeText(text)
            app.textFields[text].assertDoesNotExist()
            app.textFields[String(text.prefix(maxLength))].assertExists()
        }
    }
}
