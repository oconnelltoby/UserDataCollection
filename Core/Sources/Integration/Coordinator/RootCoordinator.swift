//
// Copyright © 2021 Toby O'Connell. All rights reserved.
//

import Domain
import Interface
import UIKit
import UserDataValidation

extension RootCoordinator {
    enum State {
        case firstName
        case lastName(FirstNameUserData)
    }
}

struct RootCoordinator: Coordinating {
    private var initialState: State
    var navigationController: UINavigationController

    init(initialState: State, navigationController: UINavigationController) {
        self.initialState = initialState
        self.navigationController = navigationController
    }

    func start() {
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
        }
    }
    
    private func firstNameScreen() -> UIViewController {
        FirstNameViewController(
            viewModel: .init(
                validator: FirstNameValidator(nameLength: 1...50),
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
                validator: LastNameValidator(nameLength: 1...50),
                store: { lastName in
                    let userData = LastNameUserData(lastName: lastName, previous: userData)
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
