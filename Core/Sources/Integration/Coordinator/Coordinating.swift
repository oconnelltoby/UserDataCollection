//
// Copyright © 2021 Toby O'Connell. All rights reserved.
//

import UIKit

public protocol Coordinating {
    var navigationController: UINavigationController { get }
    func start()
}
