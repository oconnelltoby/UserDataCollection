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
            model.title.verify()
            model.textField.verify()
            model.heading.verify()
            model.body.verify()
            model.button.verify()
            model.firstNameInfo(scenario: scenario).verify()
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
            model.alert(text: text, scenario: scenario).verify()
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
            app.textFields[text].refute()
            app.textFields[String(text.prefix(maxLength))].verify()
        }
    }
}
