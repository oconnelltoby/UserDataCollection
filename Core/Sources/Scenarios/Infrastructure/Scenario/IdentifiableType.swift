//
//  IdentifiableType.swift
//
//
//  Created by Toby O'Connell on 27/03/2021.
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
