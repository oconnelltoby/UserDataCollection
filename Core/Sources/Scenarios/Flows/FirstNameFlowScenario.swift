//
// Copyright © 2021 Toby O'Connell. All rights reserved.
//

import Domain
import Integration
import Interface
import UIKit

class FirstNameFlowScenario: Scenario {
    public static var path = Path("Flows", "First Name")
    
    static let configuration: Configuration = .standard
    static let userData = FirstNameUserData.mock
    static var firstName: String {
        userData.firstName.value
    }
    
    static var coordinator: Coordinating {
        let navigationController = UINavigationController().styleAsStandard()
        return RootCoordinator(initialState: .firstName, configuration: configuration, navigationController: navigationController)
    }
}
