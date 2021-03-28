//
//  ScenarioID.swift
//  
//
//  Created by Toby O'Connell on 28/03/2021.
//

import UIKit

struct ScenarioID: CaseIterable {
    var scenarioType: Scenario.Type
    
    init(type: Scenario.Type) {
        scenarioType = type
    }
    
    init?(rawValue: String) {
        guard let type = NSClassFromString(rawValue) else { return nil }
        guard let conformingType = type as? Scenario.Type else { return nil }
        scenarioType = conformingType
    }
    
    var rawValue: String {
        scenarioType.id
    }
    
    static let allCases: [ScenarioID] = {
        var count: UInt32 = 0
        let classes = objc_copyClassList(&count)
        let buffer = UnsafeBufferPointer(start: classes, count: Int(count))
        return Array(
            (0 ..< Int(count))
                .lazy
                .compactMap { buffer[$0] as? Scenario.Type }
                .map { ScenarioID(type: $0) }
        )
    }()
}
