//
// Copyright © 2021 Toby O'Connell. All rights reserved.
//

import Integration
import Interface
import UIKit
import UserDataValidation
import Common

protocol FirstNameScreenScenario: Scenario {
    static var result: Result<Void, Error> { get }
}

extension FirstNameScreenScenario {
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
                validate: {
                    showAlert?($0)
                    return result
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

class FirstNameSuccessScreenScenario: FirstNameScreenScenario {
    static var path = Path("Prototype Screens", "First Name", "Success")
    static let result: Result<Void, Error> = .success
}

class FirstNameFailureScreenScenario: FirstNameScreenScenario {
    static var path = Path("Prototype Screens", "First Name", "Failure")
    struct TestError: Error {}
    static let result: Result<Void, Error> = .failure(TestError())
}
