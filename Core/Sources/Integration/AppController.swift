//
//  AppController.swift
//  
//
//  Created by Toby O'Connell on 02/04/2021.
//

import UIKit

public protocol AppControlling {
    var rootViewController: UIViewController { get }
}

public class AppController: AppControlling {
    private let naviagtionController = UINavigationController()
    private lazy var coordinator = RootCoordinator(navigationController: naviagtionController)
    
    public var rootViewController: UIViewController {
        naviagtionController
    }
    
    public init() {}
    
    public func start() {
        coordinator.start()
    }
}
