//
// Copyright © 2021 Toby O'Connell. All rights reserved.
//

import UIKit

class ScenarioListViewController: HierarchyViewController {
    init(select: @escaping (ScenarioID) -> Void) throws {
        let items: [Item] = try ScenarioID.allCases
            .reduce(into: [Item]()) { items, scenarioID in
                let select = { select(scenarioID) }
                try items.insert(scenarioID.scenarioType.path, action: select)
            }
        super.init(items: items)

        title = "Scenarios"
    }
}
