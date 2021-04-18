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

func localize(_ localizable: Localizable) -> String {
    let format = NSLocalizedString(localizable.key, bundle: .module, comment: "")
    return String.localizedStringWithFormat(format, localizable.arguments)
}
