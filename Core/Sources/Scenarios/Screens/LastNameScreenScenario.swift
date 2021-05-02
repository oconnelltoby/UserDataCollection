//
// Copyright © 2021 Toby O'Connell. All rights reserved.
//

import Common
import Integration
import Interface
import UIKit
import UserDataValidation

public protocol LastNameScreenScenario: Scenario {
    static var result: Result<Void, Error> { get }
}

public extension LastNameScreenScenario {
    static var minLength: UInt { 2 }
    static var maxLength: UInt { 10 }

    static func alertTitle(for name: String) -> String {
        "\(name) submitted"
    }

    static var coordinator: Coordinating {
        var showAlert: ((String) -> Void)?

        let viewController = LastNameViewController(
            viewModel: .init(
                minLength: minLength,
                maxLength: maxLength,
                validate: { lastName in
                    result.map {
                        { showAlert?(lastName) }
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

public class LastNameSuccessScreenScenario: LastNameScreenScenario {
    public static var path = Path("Prototype Screens", "Last Name", "Success")
    public static let result: Result<Void, Error> = .success
}

public class LastNameFailureScreenScenario: LastNameScreenScenario {
    public static var path = Path("Prototype Screens", "Last Name", "Failure")
    struct TestError: Error {}
    public static let result: Result<Void, Error> = .failure(TestError())
}
