//
// Copyright © 2021 Toby O'Connell. All rights reserved.
//

import Domain
import UserDataValidation

public protocol EmailAddressValidating {
    var emailAddressLength: ClosedRange<UInt> { get }
    func makeEmailAddress(input: String) -> Result<EmailAddressModel, EmailAddressValidator.EmailAddressError>
}

extension EmailAddressValidator: EmailAddressValidating {
    public init(configuration: Configuration) throws {
        try self.init(emailAddressLength: configuration.validators.emailAddress.emailAddressLength)
    }
    
    public func makeEmailAddress(input: String) -> Result<EmailAddressModel, EmailAddressError> {
        let result: Result<EmailAddress, EmailAddressError> = makeEmailAddress(input: input)
        return result.map { $0 as EmailAddressModel }
    }
}
