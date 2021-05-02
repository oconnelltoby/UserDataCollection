//
// Copyright © 2021 Toby O'Connell. All rights reserved.
//

import UserDataValidation

public struct FirstNameUserData: Passthrough {
    public var previous: Void = ()
    public var firstName: FirstNameModel
    
    public init(firstName: FirstNameModel) {
        self.firstName = firstName
    }
}

public struct LastNameUserData: Passthrough {
    public var previous: FirstNameUserData
    public var lastName: LastNameModel
    
    public init(lastName: LastNameModel, previous: FirstNameUserData) {
        self.lastName = lastName
        self.previous = previous
    }
}
