//
// Copyright © 2021 Toby O'Connell. All rights reserved.
//

import Foundation

public extension String {
    static func random() -> String {
        UUID().uuidString
    }
}
