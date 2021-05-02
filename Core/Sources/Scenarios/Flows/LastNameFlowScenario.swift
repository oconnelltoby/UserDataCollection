//
// Copyright © 2021 Toby O'Connell. All rights reserved.
//

import Domain
import Integration
import Interface
import UIKit

class LastNameFlowScenario: Scenario {
    public static var path = Path("Flows", "Last Name")
    
    static let configuration: Configuration = .standard
    static let userData = LastNameUserData.mock
    static var lastName: String {
        userData.lastName.value
    }

    static var coordinator: Coordinating {
        let navigationController = UINavigationController().styleAsStandard()
        return RootCoordinator(initialState: .lastName(userData.previous), configuration: configuration, navigationController: navigationController)
    }
}
