//
// Copyright © 2021 Toby O'Connell. All rights reserved.
//

import Scenarios
import XCTest

class PrimaryButtonTests: XCTestCase {
    func testBasics() {
        launch(scenario: ButtonScenario.self) { app in
            let model = PrimaryButtonModel(app: app)
            model.primaryButton.verify()
            model.secondaryButton.verify()
        }
    }

    func testPrimaryButtonTapAction() {
        launch(scenario: ButtonScenario.self) { app in
            let model = PrimaryButtonModel(app: app)
            model.primaryButton.verify()
            model.primaryButton.tap()
            model.primaryButtonAlertTitle.verify()
        }
    }

    func testSecondaryButtonTapAction() {
        launch(scenario: ButtonScenario.self) { app in
            let model = PrimaryButtonModel(app: app)
            model.primaryButton.verify()
            model.primaryButton.tap()
            model.primaryButtonAlertTitle.verify()
        }
    }
}
