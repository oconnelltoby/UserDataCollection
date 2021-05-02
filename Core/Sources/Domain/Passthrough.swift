//
// Copyright © 2021 Toby O'Connell. All rights reserved.
//

@dynamicMemberLookup
protocol Passthrough {
    associatedtype Previous
    var previous: Previous { get }
    subscript<T>(dynamicMember _: KeyPath<Previous, T>) -> T { get }
}

extension Passthrough {
    subscript<T>(dynamicMember keyPath: KeyPath<Previous, T>) -> T {
        previous[keyPath: keyPath]
    }
}
