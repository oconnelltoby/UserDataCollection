//
// Copyright © 2021 Toby O'Connell. All rights reserved.
//

import Scenarios
import TestSupport
import XCTest

class FirstNameFlowTests: XCTestCase {
    func testFirstNameCompletion() {
        let scenario = FirstNameFlowScenario.self
        launch(scenario: scenario) { app in
            let firstNameScreenModel = FirstNameScreenModel(app: app)
            firstNameScreenModel.textField.tap()
            firstNameScreenModel.textField.typeText(scenario.firstName)
            firstNameScreenModel.button.tap()
            
            let lastNameScreenModel = LastNameScreenModel(app: app)
            lastNameScreenModel.heading.assertExists()
        }
    }
}
