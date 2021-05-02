//
// Copyright © 2021 Toby O'Connell. All rights reserved.
//

import UserDataValidation

public struct FirstNameUserData: Passthrough, CustomDebugStringConvertible {
    public var previous: Void = ()
    public var firstName: FirstNameModel
    
    public init(firstName: FirstNameModel) {
        self.firstName = firstName
    }

    public var debugDescription: String {
        "firstName: \(firstName.value)"
    }
}

public struct LastNameUserData: Passthrough, CustomDebugStringConvertible {
    public var previous: FirstNameUserData
    public var lastName: LastNameModel
    
    public init(lastName: LastNameModel, previous: FirstNameUserData) {
        self.lastName = lastName
        self.previous = previous
    }
    
    public var debugDescription: String {
        "\(previous), lastName: \(lastName.value)"
    }
}
