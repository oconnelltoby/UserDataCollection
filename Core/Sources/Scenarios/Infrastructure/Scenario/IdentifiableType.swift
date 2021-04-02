//
//  IdentifiableType.swift
//  
//
//  Created by Toby O'Connell on 27/03/2021.
//

import UIKit

protocol IdentifiableType: AnyObject {
    static var id: String { get }
}

extension IdentifiableType {
    static var id: String {
        NSStringFromClass(Self.self)
    }
}
