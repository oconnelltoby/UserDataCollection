//
// Copyright © 2021 Toby O'Connell. All rights reserved.
//

import Common
import Integration
import Interface
import UIKit
import UserDataValidation

public protocol FirstNameScreenScenario: Scenario {
    static var result: Result<Void, Error> { get }
}

public extension FirstNameScreenScenario {
    static var minLength: UInt { 2 }
    static var maxLength: UInt { 10 }

    static func alertTitle(for name: String) -> String {
        "\(name) submitted"
    }

    static var coordinator: Coordinating {
        var showAlert: ((String) -> Void)?

        let viewController = FirstNameViewController(
            viewModel: .init(
                minLength: minLength,
                maxLength: maxLength,
                validate: { firstName in
                    result.map {
                        { showAlert?(firstName) }
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

public class FirstNameSuccessScreenScenario: FirstNameScreenScenario {
    public static var path = Path("Prototype Screens", "First Name", "Success")
    public static let result: Result<Void, Error> = .success
}

public class FirstNameFailureScreenScenario: FirstNameScreenScenario {
    public static var path = Path("Prototype Screens", "First Name", "Failure")
    struct TestError: Error {}
    public static let result: Result<Void, Error> = .failure(TestError())
}
