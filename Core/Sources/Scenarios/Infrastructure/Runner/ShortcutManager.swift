//
// Copyright © 2021 Toby O'Connell. All rights reserved.
//

import Integration
import UIKit

class ShortcutManager {
    enum ActionType {
        case resetScenario
    }

    private let shortcuts: [(item: UIApplicationShortcutItem, action: () -> Void)]

    init(shortcuts: [(actionType: ActionType, action: () -> Void)]) {
        self.shortcuts = shortcuts.map { ($0.actionType.item, $0.action) }
    }

    func addShortcuts() {
        UIApplication.shared.shortcutItems = shortcuts.map(\.item)
    }

    func performAction(for shortcutItem: UIApplicationShortcutItem) -> Bool {
        guard let shortcut = shortcuts.first(where: { $0.item.type == shortcutItem.type }) else {
            return false
        }

        shortcut.action()
        return true
    }
}

private extension ShortcutManager.ActionType {
    var item: UIApplicationShortcutItem {
        switch self {
        case .resetScenario:
            return .init(type: "resetScenario", title: "Reset Scenario", systemImageName: "arrow.clockwise")
        }
    }
}

extension UIApplicationShortcutItem {
    convenience init(type: String, title: String, systemImageName: String) {
        self.init(
            type: type,
            localizedTitle: title,
            localizedSubtitle: nil,
            icon: UIApplicationShortcutIcon(systemImageName: systemImageName),
            userInfo: nil
        )
    }
}
