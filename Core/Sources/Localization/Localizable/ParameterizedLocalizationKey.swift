//
// Copyright © 2021 Toby O'Connell. All rights reserved.
//

public enum ParameterizedLocalizationKey {
    case first_name_info(min: UInt, max: UInt)
}

extension ParameterizedLocalizationKey {
    enum Key: String, CaseIterable {
        case first_name_info
    }

    func getKey() -> Key {
        switch self {
        case .first_name_info: return .first_name_info
        }
    }
}

extension ParameterizedLocalizationKey: Localizable {
    public var key: String {
        getKey().rawValue
    }

    public var arguments: [CVarArg] {
        switch self {
        case let .first_name_info(min, max):
            return [min, max]
        }
    }
}
