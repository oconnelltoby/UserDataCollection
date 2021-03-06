//
// Copyright © 2021 Toby O'Connell. All rights reserved.
//

import Domain

extension FirstNameUserData {
    static var mock: FirstNameUserData {
        .init(firstName: MockFirstName(value: "Toby"))
    }
}

extension LastNameUserData {
    static var mock: LastNameUserData {
        .init(lastName: MockLastName(value: "O'Connell"), previous: .mock)
    }
}

extension EmailAddressUserData {
    static var mock: EmailAddressUserData {
        .init(emailAddress: MockEmailAddress(value: "toby@example.com"), previous: .mock)
    }
}
