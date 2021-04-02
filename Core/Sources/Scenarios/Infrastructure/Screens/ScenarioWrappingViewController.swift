//
//  ScenarioCoordinator.swift
//  
//
//  Created by Toby O'Connell on 28/03/2021.
//

import Integration
import Interface
import UIKit

public class ScenarioWrappingViewController: WrappingViewController {
    private var activeScenarioID: ScenarioID? {
        didSet {
            updateContent()
        }
    }
    
    public override init() {
        super.init()
        updateContent()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
