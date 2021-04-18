//
// Copyright © 2021 Toby O'Connell. All rights reserved.
//

protocol Localizable {
    var key: String { get }
    var arguments: [CVarArg] { get }
}

extension Localizable {
    var arguments: [CVarArg] { [] }
}

extension Localizable where Self: RawRepresentable, RawValue == String {
    var key: String { rawValue }
}
