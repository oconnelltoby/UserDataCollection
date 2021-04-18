//
// Copyright © 2021 Toby O'Connell. All rights reserved.
//

import XCTest
@testable import Localization

class LocalizationTests: XCTestCase {
    func testKeysExistInResources() {
        LocalizationKey.allCases.forEach { key in
            XCTAssertEqual(
                Localization.value(forKey: key.rawValue, default: "1"),
                Localization.value(forKey: key.rawValue, default: "2")
            )
        }

        ParameterizedLocalizationKey.Key.allCases.forEach { key in
            XCTAssertEqual(
                Localization.value(forKey: key.rawValue, default: "1"),
                Localization.value(forKey: key.rawValue, default: "2")
            )
        }
    }
}
