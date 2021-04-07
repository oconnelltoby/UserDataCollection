//
// Copyright © 2021 Toby O'Connell. All rights reserved.
//

import Scenarios
import XCTest

class PrimaryButtonTests: XCTestCase {
    func testBasics() {
        launch(scenario: ButtonScenario.self) { app in
            let model = PrimaryButtonModel(app: app)
            XCTAssert(model.primaryButton.waitForExistence(timeout: 5))
            XCTAssert(model.secondaryButton.waitForExistence(timeout: 5))
        }
    }

    func testPrimaryButtonTapAction() {
        launch(scenario: ButtonScenario.self) { app in
            let model = PrimaryButtonModel(app: app)
            XCTAssert(model.primaryButton.waitForExistence(timeout: 5))
            model.primaryButton.tap()
            XCTAssert(model.primaryButtonAlertTitle.waitForExistence(timeout: 5))
        }
    }

    func testSecondaryButtonTapAction() {
        launch(scenario: ButtonScenario.self) { app in
            let model = PrimaryButtonModel(app: app)
            XCTAssert(model.primaryButton.waitForExistence(timeout: 5))
            model.primaryButton.tap()
            XCTAssert(model.primaryButtonAlertTitle.waitForExistence(timeout: 5))
        }
    }
}
