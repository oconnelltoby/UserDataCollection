//
// Copyright © 2021 Toby O'Connell. All rights reserved.
//

import UIKit

public extension UIButton {
    @discardableResult
    func addAction(_ action: @escaping () -> Void) -> Self {
        addAction(.init(handler: { _ in action() }), for: .touchUpInside)
        return self
    }
}

public extension UITextField {
    @discardableResult
    func addAction(_ action: @escaping () -> Void) -> Self {
        addAction(.init(handler: { _ in action() }), for: .editingChanged)
        return self
    }
}
