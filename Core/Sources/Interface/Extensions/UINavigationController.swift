//
// Copyright © 2021 Toby O'Connell. All rights reserved.
//

import UIKit

public extension UINavigationController {
    @discardableResult
    func styleAsStandard() -> Self {
        navigationBar.isTranslucent = true
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
        return self
    }
}
