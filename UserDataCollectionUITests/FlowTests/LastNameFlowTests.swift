//
// Copyright © 2021 Toby O'Connell. All rights reserved.
//

import Scenarios
import TestSupport
import XCTest

class LastNameFlowTests: XCTestCase {
    func testLastNameCompletion() {
        let scenario = LastNameFlowScenario.self
        launch(scenario: scenario) { app in
            let lastNameScreenModel = LastNameScreenModel(app: app)
            lastNameScreenModel.textField.tap()
            lastNameScreenModel.textField.typeText(scenario.lastName)
            lastNameScreenModel.button.tap()
            
            let emailAddressScreenModel = EmailAddressScreenModel(app: app)
            emailAddressScreenModel.heading.assertExists()
        }
    }
}
