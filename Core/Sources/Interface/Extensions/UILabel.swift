//
// Copyright © 2021 Toby O'Connell. All rights reserved.
//

import Localization
import UIKit

public extension UILabel {
    @discardableResult
    func styleAsDyanmicText(_ style: UIFont.TextStyle) -> Self {
        font = .preferredFont(forTextStyle: style)
        numberOfLines = 0
        adjustsFontForContentSizeCategory = true
        return self
    }

    @discardableResult
    func addText(_ text: String) -> Self {
        self.text = text
        return self
    }

    @discardableResult
    func centralize() -> Self {
        textAlignment = .center
        return self
    }

    @discardableResult
    func styleAsHeader() -> Self {
        accessibilityTraits.insert(.header)
        return self
    }
}

extension UILabel {
    static func body(_ text: String) -> UILabel {
        UILabel().styleAsDyanmicText(.body).addText(text)
    }

    static func body(_ key: LocalizationKey) -> UILabel {
        .body(localize(key))
    }

    static func body(_ key: ParameterizedLocalizationKey) -> UILabel {
        .body(localize(key))
    }
}

extension UILabel {
    static func heading(_ text: String) -> UILabel {
        UILabel().styleAsDyanmicText(.title1).styleAsHeader().addText(text)
    }
    
    static func heading(_ key: LocalizationKey) -> UILabel {
        .heading(localize(key))
    }

    static func heading(_ key: ParameterizedLocalizationKey) -> UILabel {
        .heading(localize(key))
    }
}
