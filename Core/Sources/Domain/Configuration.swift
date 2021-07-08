//
// Copyright © 2021 Toby O'Connell. All rights reserved.
//

public struct Configuration {
    public var validators: Validators
}

public extension Configuration {
    struct Validators {
        public var firstName: FirstName
        public var lastName: LastName
        public var emailAddress: EmailAddress
    }
}

public extension Configuration.Validators {
    struct FirstName {
        public var nameLength: ClosedRange<UInt>
    }
    
    struct LastName {
        public var nameLength: ClosedRange<UInt>
    }
    
    struct EmailAddress {
        public var emailAddressLength: ClosedRange<UInt>
    }
}

public extension Configuration {
    static var standard: Configuration {
        .init(
            validators: .init(
                firstName: .init(nameLength: 1 ... 50),
                lastName: .init(nameLength: 1 ... 50),
                emailAddress: .init(emailAddressLength: 1 ... 50)
            )
        )
    }
}
