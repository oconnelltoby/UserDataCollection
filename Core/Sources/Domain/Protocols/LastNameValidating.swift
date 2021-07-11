//
// Copyright © 2021 Toby O'Connell. All rights reserved.
//

import UserDataValidation

public protocol LastNameValidating {
    var nameLength: ClosedRange<UInt> { get }
    func makeLastName(input: String) -> Result<LastNameModel, LastNameValidator.LastNameError>
}

extension LastNameValidator: LastNameValidating {
    public init(configuration: Configuration) {
        self.init(nameLength: configuration.validators.lastName.nameLength)
    }
    
    public func makeLastName(input: String) -> Result<LastNameModel, LastNameError> {
        let result: Result<LastName, LastNameError> = makeLastName(input: input)
        return result.map { $0 as LastNameModel }
    }
}
