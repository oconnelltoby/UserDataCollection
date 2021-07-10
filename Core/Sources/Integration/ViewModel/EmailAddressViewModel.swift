//
// Copyright © 2021 Toby O'Connell. All rights reserved.
//

import Common
import Domain
import Interface
import Localization
import UserDataValidation

extension SingleFieldViewModel {
    static func email(validator: EmailAddressValidating, store: @escaping (EmailAddressModel) -> Void) -> Self {
        .init(
            labels: .init(
                title: localize(.email_address_title),
                heading: localize(.email_address_heading),
                body: localize(.email_address_body),
                info: localize(
                    .email_address_info(
                        min: validator.emailAddressLength.lowerBound,
                        max: validator.emailAddressLength.upperBound
                    )
                ),
                button: localize(.email_address_button),
                textField: localize(.email_address_textfield_placeholder)
            ),
            maxLength: validator.emailAddressLength.upperBound,
            validate: { input in
                let result = validator.makeEmailAddress(input: input)
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
