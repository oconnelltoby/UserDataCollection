//
// Copyright © 2021 Toby O'Connell. All rights reserved.
//

import Common
import Domain
import Interface
import Localization
import UserDataValidation

extension SingleFieldViewModel {
    static func lastName(validator: LastNameValidating, store: @escaping (LastNameModel) -> Void) -> Self {
        .init(
            labels: .init(
                title: localize(.last_name_title),
                heading: localize(.last_name_heading),
                body: localize(.last_name_body),
                info: localize(
                    .last_name_info(
                        min: validator.nameLength.lowerBound,
                        max: validator.nameLength.upperBound
                    )
                ),
                button: localize(.last_name_button),
                textField: localize(.last_name_textfield_placeholder)
            ),
            maxLength: validator.nameLength.upperBound,
            validate: validator.makeLastName,
            store: store
        )
    }
}
