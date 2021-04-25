//
// Copyright © 2021 Toby O'Connell. All rights reserved.
//

import Foundation

public extension String {
    static func random() -> String {
        UUID().uuidString
    }

    static func random(length: Int) -> String {
        var letters = String()
        return (0 ..< length).reduce(into: "") { string, _ in
            if letters.isEmpty {
                letters = String.random()
            }
            letters.popLast().map { string.append($0) }
        }
    }
}
