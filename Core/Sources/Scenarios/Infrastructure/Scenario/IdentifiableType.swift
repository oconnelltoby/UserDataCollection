//
// Copyright © 2021 Toby O'Connell. All rights reserved.
//

import UIKit

public protocol IdentifiableType: AnyObject {
    static var id: String { get }
}

public extension IdentifiableType {
    static var id: String {
        NSStringFromClass(Self.self)
    }
}
