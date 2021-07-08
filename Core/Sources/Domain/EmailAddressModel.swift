//
// Copyright © 2021 Toby O'Connell. All rights reserved.
//

import UserDataValidation

public protocol EmailAddressModel {
    var value: String { get }
}

extension EmailAddress: EmailAddressModel {}
