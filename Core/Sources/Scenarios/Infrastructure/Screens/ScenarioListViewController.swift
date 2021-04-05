//
//  ScenarioListViewController.swift
//
//
//  Created by Toby O'Connell on 28/03/2021.
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
    }
}
