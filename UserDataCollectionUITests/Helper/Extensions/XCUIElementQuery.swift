//
// Copyright © 2021 Toby O'Connell. All rights reserved.
//

import Localization
import XCTest

extension XCUIElementQuery {
    subscript(key: LocalizationKey) -> XCUIElement {
        self[localize(key)]
    }

    subscript(key: ParameterizedLocalizationKey) -> XCUIElement {
        self[localize(key)]
    }
}
