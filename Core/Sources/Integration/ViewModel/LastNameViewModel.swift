//
// Copyright © 2021 Toby O'Connell. All rights reserved.
//

import Common
import Domain
import Interface
import UserDataValidation

extension LastNameViewModel {
    init(validator: LastNameValidating, store: @escaping (LastNameModel) -> Void) {
        self.init(
            minLength: validator.nameLength.lowerBound,
            maxLength: validator.nameLength.upperBound,
            validate: { input in
                let result = validator.makeLastName(input: input)
                switch result {
                case let .success(firstName):
                    store(firstName)
                    return .success
                case let .failure(error):
                    return .failure(error)
                }
            }
        )
    }
}
