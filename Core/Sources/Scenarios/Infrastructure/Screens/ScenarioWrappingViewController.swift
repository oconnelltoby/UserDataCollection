//
// Copyright © 2021 Toby O'Connell. All rights reserved.
//

import Integration
import Interface
import UIKit

class ScenarioWrappingViewController: WrappingViewController {
    @UserDefault(UserDefaultKeys.activeScenarioID) private var activeScenarioID: ScenarioID? {
        didSet {
            updateContent()
        }
    }

    override init() {
        super.init()
        updateContent()
    }

    func updateContent() {
        if let activeScenarioID = activeScenarioID {
            let coordinator = activeScenarioID.scenarioType.coordinator
            content = coordinator.navigationController
            coordinator.start()
        } else {
            do {
                let viewController = try ScenarioListViewController { [weak self] id in
                    self?.activeScenarioID = id
                }
                content = viewController
            } catch {
                print(error)
            }
        }
    }
}
