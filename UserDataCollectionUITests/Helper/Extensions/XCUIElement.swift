//
// Copyright © 2021 Toby O'Connell. All rights reserved.
//

import XCTest

extension XCUIElement {
    func assertExists() {
        XCTAssert(waitForExistence(timeout: 5))
    }

    func assertDoesNotExist() {
        XCTAssertFalse(waitForExistence(timeout: 5))
    }
}
