//
// Copyright © 2021 Toby O'Connell. All rights reserved.
//

import Foundation

public func localize(_ localizable: ParameterizedLocalizationKey) -> String {
    localize(localizable as Localizable)
}

public func localize(_ localizable: LocalizationKey) -> String {
    localize(localizable as Localizable)
}

func value(forKey key: String, default: String = "") -> String {
    NSLocalizedString(key, bundle: .module, value: `default`, comment: "")
}

func localize(_ localizable: Localizable) -> String {
    String(format: value(forKey: localizable.key), arguments: localizable.arguments)
}
