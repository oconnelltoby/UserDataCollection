//
// Copyright © 2021 Toby O'Connell. All rights reserved.
//

import Integration

public protocol Scenario: IdentifiableType {
    static var path: Path { get }
    static var coordinator: Coordinating { get }
}
