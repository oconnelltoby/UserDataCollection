//
// Copyright © 2021 Toby O'Connell. All rights reserved.
//

import Domain
import Integration
import UserDataValidation

struct MockLastNameValidator: LastNameValidating {
    var validInput: String
    var tooLongInput: String
    var tooShortInput: String
    var nameLength: ClosedRange<UInt>

    func makeLastName(input: String) -> Result<LastNameModel, LastNameValidator.LastNameError> {
        switch input {
        case tooLongInput:
            return .failure(.tooLong)
        case tooShortInput:
            return .failure(.tooShort)
        default:
            return .success(MockLastName(value: input))
        }
    }
}
