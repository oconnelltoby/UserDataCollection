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
            XCTAssert(model.title.waitForExistence(timeout: 5))
            XCTAssert(model.textField.waitForExistence(timeout: 5))
            XCTAssert(model.heading.waitForExistence(timeout: 5))
            XCTAssert(model.body.waitForExistence(timeout: 5))
            XCTAssert(model.button.waitForExistence(timeout: 5))
            XCTAssert(model.firstNameInfo(scenario: scenario).waitForExistence(timeout: 5))
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
            XCTAssert(model.alert(text: text, scenario: scenario).waitForExistence(timeout: 5))
        }
    }
}
