//
// Copyright © 2021 Toby O'Connell. All rights reserved.
//

import UserDataValidation

public protocol FirstNameModel {
    var value: String { get }
}

extension FirstName: FirstNameModel {}
