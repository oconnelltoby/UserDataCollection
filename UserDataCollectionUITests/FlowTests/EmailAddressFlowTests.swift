//
// Copyright © 2021 Toby O'Connell. All rights reserved.
//

import Scenarios
import TestSupport
import XCTest

class EmailAddressFlowTests: XCTestCase {
    func testFirstNameCompletion() {
        let scenario = EmailAddressFlowScenario.self
        launch(scenario: scenario) { app in
            let emailScreenModel = EmailAddressScreenModel(app: app)
            emailScreenModel.textField.tap()
            emailScreenModel.textField.typeText(scenario.emailAddress)
            emailScreenModel.button.tap()
            
            let alertTitle = scenario.userData.debugDescription
            app.staticTexts[alertTitle].assertExists()
        }
    }
}
