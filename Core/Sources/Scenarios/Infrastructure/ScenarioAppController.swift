//
//  ScenarioAppController.swift
//  
//
//  Created by Toby O'Connell on 02/04/2021.
//

import Integration
import UIKit

public class ScenarioAppController: AppController {
    @UserDefault(UserDefaultKeys.activeScenarioID) private var activeScenarioID: ScenarioID? {
        didSet {
            coordinator.updateContent()
        }
    }
    
    public init() {}
    
    private let naviagtionController = UINavigationController()
    private lazy var coordinator = ScenarioCoordinator(navigationController: naviagtionController)
    
    public var rootViewController: UIViewController {
        naviagtionController
    }
    
    private var shortcutManager: ShortcutManager {
        .init(shortcuts: [
            (actionType: .resetScenario, action: { [weak self] in
                self?.activeScenarioID = nil
            })
        ])
    }
    
    public func performAction(for shortcutItem: UIApplicationShortcutItem) -> Bool {
        shortcutManager.performAction(for: shortcutItem)
    }
    
    public func start() {
        coordinator.start()
    }
}
