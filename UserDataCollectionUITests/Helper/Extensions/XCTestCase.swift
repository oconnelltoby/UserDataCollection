//
// Copyright © 2021 Toby O'Connell. All rights reserved.
//

@_exported import Scenarios
import XCTest

extension XCTestCase {
    func launch(scenario: Scenario.Type, work: (XCUIApplication) throws -> Void) rethrows {
        let app = XCUIApplication()
        app.launchArguments.append(contentsOf: ["-\(UserDefaultKeys.activeScenarioID)", scenario.id])
        app.launch()
        try work(app)
    }
}
