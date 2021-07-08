//
// Copyright © 2021 Toby O'Connell. All rights reserved.
//

import Common
import Integration
import Interface
import UIKit
import UserDataValidation

public protocol EmailAddressScreenScenario: Scenario {
    static var result: Result<Void, Error> { get }
}

public extension EmailAddressScreenScenario {
    static var minLength: UInt { 2 }
    static var maxLength: UInt { 10 }

    static func alertTitle(for emailAddress: String) -> String {
        "\(emailAddress) submitted"
    }

    static var coordinator: Coordinating {
        var showAlert: ((String) -> Void)?

        let viewController = EmailAddressViewController(
            viewModel: .init(
                minLength: minLength,
                maxLength: maxLength,
                validate: { emailAddress in
                    result.map {
                        { showAlert?(emailAddress) }
                    }
                }
            )
        )

        showAlert = { [weak viewController] in
            let title = alertTitle(for: $0)
            viewController?.showAlert(title: title, actionTitle: "Ok")
        }

        return SimpleCoordinator(rootViewController: viewController)
    }
}

public class EmailAddressSuccessScreenScenario: EmailAddressScreenScenario {
    public static var path = Path("Prototype Screens", "Email Address", "Success")
    public static let result: Result<Void, Error> = .success
}

public class EmailAddressFailureScreenScenario: EmailAddressScreenScenario {
    public static var path = Path("Prototype Screens", "Email Address", "Failure")
    struct TestError: Error {}
    public static let result: Result<Void, Error> = .failure(TestError())
}
