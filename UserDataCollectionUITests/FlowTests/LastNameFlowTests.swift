//
// Copyright © 2021 Toby O'Connell. All rights reserved.
//

import Scenarios
import TestSupport
import XCTest

class LastNameFlowTests: XCTestCase {
    func testFirstNameCompletion() {
        let scenario = LastNameFlowScenario.self
        launch(scenario: scenario) { app in
            let firstNameScreenModel = LastNameScreenModel(app: app)
            firstNameScreenModel.textField.tap()
            firstNameScreenModel.textField.typeText(scenario.lastName)
            firstNameScreenModel.button.tap()
            
            let emailAddressScreenModel = EmailAddressScreenModel(app: app)
            emailAddressScreenModel.heading.assertExists()
        }
    }
}
