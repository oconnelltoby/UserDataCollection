//
// Copyright © 2021 Toby O'Connell. All rights reserved.
//

import Integration
import UIKit

public class ScenarioAppController: AppControlling {
    @UserDefault(UserDefaultKeys.activeScenarioID) private var activeScenarioID: ScenarioID? {
        didSet {
            coordinator.updateContent()
        }
    }

    public init() {
        shortcutManager.addShortcuts()
    }

    private let naviagtionController = UINavigationController()
    private lazy var coordinator = ScenarioCoordinator(navigationController: naviagtionController)

    public var rootViewController: UIViewController {
        naviagtionController
    }

    private var shortcutManager: ShortcutManager {
        .init(shortcuts: [
            (actionType: .resetScenario, action: { [weak self] in
                self?.activeScenarioID = nil
            }),
        ])
    }

    public func performAction(for shortcutItem: UIApplicationShortcutItem) -> Bool {
        shortcutManager.performAction(for: shortcutItem)
    }

    public func start() {
        coordinator.start()
    }
}
