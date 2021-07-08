//
// Copyright © 2021 Toby O'Connell. All rights reserved.
//

import Domain
import Integration
import UserDataValidation

struct MockEmailAddressValidator: EmailAddressValidating {
    var validInput: String
    var tooLongInput: String
    var tooShortInput: String
    var emailAddressLength: ClosedRange<UInt>

    func makeEmailAddress(input: String) -> Result<EmailAddressModel, EmailAddressValidator.EmailAddressError> {
        switch input {
        case tooLongInput:
            return .failure(.tooLong)
        case tooShortInput:
            return .failure(.tooShort)
        default:
            return .success(MockEmailAddress(value: input))
        }
    }
}
