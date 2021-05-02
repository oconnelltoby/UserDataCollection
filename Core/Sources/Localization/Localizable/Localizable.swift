//
// Copyright © 2021 Toby O'Connell. All rights reserved.
//

public protocol Localizable {
    var key: String { get }
    var arguments: [CVarArg] { get }
}

public extension Localizable {
    var arguments: [CVarArg] { [] }
}

public extension Localizable where Self: RawRepresentable, RawValue == String {
    var key: String { rawValue }
}
