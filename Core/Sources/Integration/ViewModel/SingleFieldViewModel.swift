//
// Copyright © 2021 Toby O'Connell. All rights reserved.
//

import Interface

extension SingleFieldViewModel {
    init<Value, Error: Swift.Error>(
        labels: Labels,
        maxLength: UInt,
        validate: @escaping (String) -> Result<Value, Error>,
        store: @escaping (Value) -> Void
    ) {
        self.init(
            labels: labels,
            maxLength: maxLength,
            validate: { input in
                switch validate(input) {
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
