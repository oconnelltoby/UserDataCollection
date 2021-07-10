//
// Copyright © 2021 Toby O'Connell. All rights reserved.
//

import Common
import Domain
import Interface
import Localization
import UserDataValidation

extension SingleFieldViewModel {
    static func firstName(validator: FirstNameValidating, store: @escaping (FirstNameModel) -> Void) -> Self {
        .init(
            labels: .init(
                title: localize(.first_name_title),
                heading: localize(.first_name_heading),
                body: localize(.first_name_body),
                info: localize(
                    .first_name_info(
                        min: validator.nameLength.lowerBound,
                        max: validator.nameLength.upperBound
                    )
                ),
                button: localize(.first_name_button),
                textField: localize(.first_name_textfield_placeholder)
            ),
            maxLength: validator.nameLength.upperBound,
            validate: { input in
                let result = validator.makeFirstName(input: input)
                switch result {
                case let .success(firstName):
                    return .success {
                        store(firstName)
                    }
                case let .failure(error):
                    return .failure(error)
                }
            }
        )
    }
}
