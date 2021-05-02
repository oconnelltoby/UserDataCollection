//
// Copyright © 2021 Toby O'Connell. All rights reserved.
//

import UserDataValidation

public protocol LastNameModel {
    var value: String { get }
}

extension LastName: LastNameModel {}
