//
// Copyright © 2021 Toby O'Connell. All rights reserved.
//

import XCTest

extension XCUIElement {
    func verify() {
        XCTAssert(waitForExistence(timeout: 5))
    }
}
