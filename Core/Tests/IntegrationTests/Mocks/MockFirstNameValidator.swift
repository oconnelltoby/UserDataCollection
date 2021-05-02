//
// Copyright © 2021 Toby O'Connell. All rights reserved.
//

import Domain
import Integration
import UserDataValidation

struct MockFirstNameValidator: FirstNameValidating {
    var validInput: String
    var tooLongInput: String
    var tooShortInput: String
    var nameLength: ClosedRange<UInt>

    func makeFirstName(input: String) -> Result<FirstNameModel, FirstNameValidator.FirstNameError> {
        switch input {
        case tooLongInput:
            return .failure(.tooLong)
        case tooShortInput:
            return .failure(.tooShort)
        default:
            return .success(MockFirstName(value: input))
        }
    }
}
