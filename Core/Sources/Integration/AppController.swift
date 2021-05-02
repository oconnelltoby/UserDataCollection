//
// Copyright © 2021 Toby O'Connell. All rights reserved.
//

import UIKit

public protocol AppControlling {
    var rootViewController: UIViewController { get }
}

public class AppController: AppControlling {
    private let naviagtionController = UINavigationController().styleAsStandard()
    private lazy var coordinator = RootCoordinator(initialState: .firstName, navigationController: naviagtionController)

    public var rootViewController: UIViewController {
        naviagtionController
    }

    public init() {}

    public func start() {
        coordinator.start()
    }
}
