//
//  File.swift
//
//
//  Created by Toby O'Connell on 28/03/2021.
//

import UIKit

public enum ColorName: String, CaseIterable {
    case accentGreen = "AccentGreen"
    case accentTeal = "AccentTeal"
    case primaryText = "PrimaryText"
    case background = "Background"
}

extension UIColor {
    static var bundle = Bundle.main

    public convenience init(_ name: ColorName) {
        self.init(named: name.rawValue)!
    }

    static func hasColor(for name: ColorName) -> Bool {
        Self(named: name.rawValue) != nil
    }

    private convenience init(named name: String) {
        self.init(named: name, in: Self.bundle, compatibleWith: .current)!
    }
}
