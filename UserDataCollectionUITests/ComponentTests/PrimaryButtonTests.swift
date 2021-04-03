//
//  PrimaryButtonTests.swift
//  UserDataCollectionUITests
//
//  Created by Toby O'Connell on 31/03/2021.
//

import XCTest
import Scenarios

class PrimaryButtonTests: XCTestCase {
    func testBasics() {
        launch(scenario: PrimaryButtonScenario.self) { app in
            let model = PrimaryButtonModel(app: app)
            XCTAssert(model.button.waitForExistence(timeout: 5))
        }
    }
    
    func testButtonTapAction() {
        launch(scenario: PrimaryButtonScenario.self) { app in
            let model = PrimaryButtonModel(app: app)
            XCTAssert(model.button.waitForExistence(timeout: 5))
            model.button.tap()
            XCTAssert(model.alertTitle.waitForExistence(timeout: 5))
        }
    }
}
