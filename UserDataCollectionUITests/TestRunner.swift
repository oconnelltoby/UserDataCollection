//
//  UserDataCollectionUITests.swift
//  UserDataCollectionUITests
//
//  Created by Toby O'Connell on 27/03/2021.
//

import XCTest
@_exported import Scenarios

extension XCTestCase {
    func launch(scenario: Scenario.Type, work: (XCUIApplication) throws -> Void) rethrows {
        let app = XCUIApplication()
        app.launchArguments.append(contentsOf: ["-\(UserDefaultKeys.activeScenarioID)", scenario.id])
        app.launch()
        try work(app)
    }
}
