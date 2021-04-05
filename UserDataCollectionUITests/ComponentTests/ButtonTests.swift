//
//  PrimaryButtonTests.swift
//  UserDataCollectionUITests
//
//  Created by Toby O'Connell on 31/03/2021.
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
