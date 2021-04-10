//
// Copyright © 2021 Toby O'Connell. All rights reserved.
//

import Scenarios
import XCTest

class TextFieldTests: XCTestCase {
    func testBasics() {
        launch(scenario: TextFieldScenario.self) { app in
            let model = TextFieldModel(app: app)
            XCTAssert(model.placeholderTextField.waitForExistence(timeout: 5))
            XCTAssert(model.textField.waitForExistence(timeout: 5))
        }
    }
}
