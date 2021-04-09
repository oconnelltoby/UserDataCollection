//
// Copyright © 2021 Toby O'Connell. All rights reserved.
//

import QuartzCore

extension CATransaction {
    static func disableAnimations(_ action: () -> Void) {
        begin()
        setDisableActions(true)
        action()
        commit()
    }
}
