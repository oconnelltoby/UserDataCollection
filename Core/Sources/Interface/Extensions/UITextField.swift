//
// Copyright © 2021 Toby O'Connell. All rights reserved.
//

import UIKit

extension UITextField {
    @discardableResult
    func withDelegate(_ delegate: UITextFieldDelegate) -> Self {
        self.delegate = delegate
        return self
    }
}
