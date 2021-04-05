//
//  Scenario.swift
//
//
//  Created by Toby O'Connell on 27/03/2021.
//

import Integration

public protocol Scenario: IdentifiableType {
    static var path: Path { get }
    static var coordinator: Coordinating { get }
}
