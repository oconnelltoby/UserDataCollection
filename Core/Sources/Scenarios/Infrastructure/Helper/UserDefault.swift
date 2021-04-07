//
// Copyright © 2021 Toby O'Connell. All rights reserved.
//

import Foundation

@propertyWrapper
public struct UserDefault<Value> {
    private let get: () -> Value
    private let set: (Value) -> Void

    public var wrappedValue: Value {
        get { get() }
        set { set(newValue) }
    }
}

extension UserDefault {
    init<T>(_ key: String, userDefaults: UserDefaults = .standard) where Value == T? {
        get = { userDefaults.value(forKey: key) as? T }
        set = { userDefaults.setValue($0, forKey: key) }
    }
}

extension UserDefault {
    init<T: RawRepresentable>(_ key: String, userDefaults: UserDefaults = .standard) where Value == T? {
        get = {
            userDefaults.value(forKey: key)
                .flatMap { $0 as? T.RawValue }
                .flatMap { T(rawValue: $0) }
        }
        set = { userDefaults.setValue($0?.rawValue, forKey: key) }
    }
}
