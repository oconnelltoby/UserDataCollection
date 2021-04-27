//
// Copyright © 2021 Toby O'Connell. All rights reserved.
//

import UserDataValidation

public protocol FirstNameValidating {
    var nameLength: ClosedRange<UInt> { get }
    func makeFirstName(input: String) -> Result<FirstNameModel, FirstNameValidator.FirstNameError>
}

extension FirstNameValidator: FirstNameValidating {
    public func makeFirstName(input: String) -> Result<FirstNameModel, FirstNameError> {
        let result: Result<FirstName, FirstNameError> = makeFirstName(input: input)
        return result.map { $0 as FirstNameModel }
    }
}
