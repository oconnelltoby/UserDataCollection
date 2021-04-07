//
// Copyright © 2021 Toby O'Connell. All rights reserved.
//

import UIKit

public extension UIView {
    func addAutoLayoutSubview(_ view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
    }

    func addFillingSubview(_ view: UIView) {
        addAutoLayoutSubview(view)
        constrain(self, to: view)
    }
}
