//
// Copyright © 2021 Toby O'Connell. All rights reserved.
//

import Domain
import Integration
import Interface
import UIKit

public class EmailAddressFlowScenario: Scenario {
    public static var path = Path("Flows", "Email Address")
    
    static let configuration: Configuration = .standard
    public static let userData = EmailAddressUserData.mock
    public static var emailAddress: String {
        userData.emailAddress.value
    }
    
    public static var coordinator: Coordinating {
        let navigationController = UINavigationController().styleAsStandard()
        return RootCoordinator(initialState: .emailAddres(userData.previous), configuration: configuration, navigationController: navigationController)
    }
}
