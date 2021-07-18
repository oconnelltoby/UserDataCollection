//
// Copyright © 2021 Toby O'Connell. All rights reserved.
//

import Common
import Integration
import Interface
import UIKit
import UserDataValidation

public protocol SingleFieldScreenScenario: Scenario {
    static var result: Result<Void, Error> { get }
}

public extension SingleFieldScreenScenario {
    static var input: String { "Input" }
    static var maxLength: UInt { UInt(input.count) }
    static var title: String { "Title" }
    static var heading: String { "Heading" }
    static var body: String { "Body" }
    static var info: String { "Info" }
    static var button: String { "Button" }
    static var textField: String { "Text field placeholder" }

    static func alertTitle(for input: String) -> String {
        "\(input) submitted"
    }

    static var coordinator: Coordinating {
        var showAlert: ((String) -> Void)?

        let viewController = SingleFieldViewController(
            viewModel: .init(
                labels: .init(
                    title: title,
                    heading: heading,
                    body: body,
                    info: info,
                    button: button,
                    textField: textField
                ),
                maxLength: maxLength,
                validate: { input in
                    result.map {
                        { showAlert?(input) }
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

public class SingleFieldSuccessScreenScenario: SingleFieldScreenScenario {
    public static var path = Path("Screens", "Single Field", "Success")
    public static let result: Result<Void, Error> = .success
}

public class SingleFieldFailureScreenScenario: SingleFieldScreenScenario {
    public static var path = Path("Screens", "Single Field", "Failure")
    struct TestError: Error {}
    public static let result: Result<Void, Error> = .failure(TestError())
}
