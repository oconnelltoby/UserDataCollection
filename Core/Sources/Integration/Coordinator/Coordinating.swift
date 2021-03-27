//
//  Coordinating.swift
//  
//
//  Created by Toby O'Connell on 27/03/2021.
//

import UIKit

public protocol Coordinating {
    var navigationController: UINavigationController { get }
    func start()
}
