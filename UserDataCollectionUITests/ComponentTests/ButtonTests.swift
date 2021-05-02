//
// Copyright © 2021 Toby O'Connell. All rights reserved.
//

import Scenarios
import XCTest

class PrimaryButtonTests: XCTestCase {
    func testBasics() {
        launch(scenario: ButtonScenario.self) { app in
            let model = ButtonModel(app: app)
            model.primaryButton.assertExists()
            model.secondaryButton.assertExists()
        }
    }

    func testPrimaryButtonTapAction() {
        launch(scenario: ButtonScenario.self) { app in
            let model = ButtonModel(app: app)
            model.primaryButton.assertExists()
            model.primaryButton.tap()
            model.primaryButtonAlertTitle.assertExists()
        }
    }

    func testSecondaryButtonTapAction() {
        launch(scenario: ButtonScenario.self) { app in
            let model = ButtonModel(app: app)
            model.secondaryButton.assertExists()
            model.secondaryButton.tap()
            model.secondaryButtonAlertTitle.assertExists()
        }
    }
}
