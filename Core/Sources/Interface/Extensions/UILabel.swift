//
// Copyright © 2021 Toby O'Connell. All rights reserved.
//

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

    static func body(_ text: String) -> UILabel {
        UILabel().styleAsDyanmicText(.body).addText(text)
    }

    static func heading(_ text: String) -> UILabel {
        UILabel().styleAsDyanmicText(.title1).styleAsHeader().addText(text)
    }
}
