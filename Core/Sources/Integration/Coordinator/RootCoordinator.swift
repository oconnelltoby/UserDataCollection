//
// Copyright © 2021 Toby O'Connell. All rights reserved.
//

import Domain
import Interface
import UIKit
import UserDataValidation

public extension RootCoordinator {
    enum State {
        case firstName
        case lastName(FirstNameUserData)
        case emailAddres(LastNameUserData)
    }
}

public struct RootCoordinator: Coordinating {
    private var initialState: State
    public var navigationController: UINavigationController
    private let configuration: Configuration

    public init(initialState: State, configuration: Configuration = .standard, navigationController: UINavigationController) {
        self.initialState = initialState
        self.navigationController = navigationController
        self.configuration = configuration
    }

    public func start() {
        setState(initialState)
    }
    
    private func setState(_ state: State) {
        let viewController = screen(for: state)
        navigationController.pushViewController(viewController, animated: true)
    }
    
    private func screen(for state: State) -> UIViewController {
        switch state {
        case .firstName:
            return firstNameScreen()
        case let .lastName(userData):
            return lastNameScreen(userData: userData)
        case let .emailAddres(userData):
            return emailAddressScreen(userData: userData)
        }
    }
    
    private func firstNameScreen() -> UIViewController {
        FirstNameViewController(
            viewModel: .init(
                validator: FirstNameValidator(configuration: configuration),
                store: { firstName in
                    let userData = FirstNameUserData(firstName: firstName)
                    setState(.lastName(userData))
                }
            )
        )
    }
    
    private func lastNameScreen(userData: FirstNameUserData) -> UIViewController {
        LastNameViewController(
            viewModel: .init(
                validator: LastNameValidator(configuration: configuration),
                store: { lastName in
                    let userData = LastNameUserData(lastName: lastName, previous: userData)
                    setState(.emailAddres(userData))
                }
            )
        )
    }

    private func emailAddressScreen(userData: LastNameUserData) -> UIViewController {
        guard let validator = try? EmailAddressValidator(configuration: configuration) else {
            preconditionFailure("Unable to create \(EmailAddressValidator.self)")
        }
        
        return SingleFieldViewController(
            viewModel: .email(
                validator: validator,
                store: { emailAddress in
                    let userData = EmailAddressUserData(emailAddress: emailAddress, previous: userData)
                    showCompletionAlert(message: "\(userData)")
                }
            )
        )
    }
    
    private func showCompletionAlert(message: String) {
        let alert = UIAlertController(title: "Completed", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(action)
        navigationController.present(alert, animated: true)
    }
}
