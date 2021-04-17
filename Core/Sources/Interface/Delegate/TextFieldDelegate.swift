//
// Copyright © 2021 Toby O'Connell. All rights reserved.
//

import UIKit

class TextFieldDelegate: NSObject, UITextFieldDelegate {
    var shouldReturn: (UITextField) -> Bool = { _ in true }

    init(shouldReturn: ((UITextField) -> Bool)? = nil) {
        if let shouldReturn = shouldReturn {
            self.shouldReturn = shouldReturn
        }
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        shouldReturn(textField)
    }
}

extension TextFieldDelegate {
    @discardableResult
    func resignOnReturn() -> Self {
        let shouldReturn = self.shouldReturn
        self.shouldReturn = {
            $0.resignFirstResponder()
            return shouldReturn($0)
        }
        return self
    }
}
