//
// Copyright © 2021 Toby O'Connell. All rights reserved.
//

import UIKit

class TextFieldDelegate: NSObject, UITextFieldDelegate {
    var shouldReturn: (UITextField) -> Bool = { _ in true }
    var shouldChange: (UITextField, NSRange, String) -> Bool = { _, _, _ in true }

    init(
        shouldReturn: ((UITextField) -> Bool)? = nil,
        shouldChange: ((UITextField, NSRange, String) -> Bool)? = nil
    ) {
        if let shouldReturn = shouldReturn {
            self.shouldReturn = shouldReturn
        }

        if let shouldChange = shouldChange {
            self.shouldChange = shouldChange
        }
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        shouldReturn(textField)
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        shouldChange(textField, range, string)
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

    @discardableResult
    func capAt(length: UInt) -> Self {
        let shouldChange = self.shouldChange
        self.shouldChange = { textField, range, string in
            let text = textField.text ?? ""
            guard let textRange = Range(range, in: text) else { return false }
            let updatedText = text.replacingCharacters(in: textRange, with: string)
            let isShortEnough = updatedText.count <= length

            return shouldChange(textField, range, string) && isShortEnough
        }
        return self
    }
}
