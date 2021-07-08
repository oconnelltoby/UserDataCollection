//
// Copyright © 2021 Toby O'Connell. All rights reserved.
//

import Common
import Domain
import Interface
import UserDataValidation

extension EmailAddressViewModel {
    init(validator: EmailAddressValidating, store: @escaping (EmailAddressModel) -> Void) {
        self.init(
            minLength: validator.emailAddressLength.lowerBound,
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
