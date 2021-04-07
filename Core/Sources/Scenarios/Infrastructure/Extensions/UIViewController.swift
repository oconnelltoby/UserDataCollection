//
// Copyright © 2021 Toby O'Connell. All rights reserved.
//

import UIKit

extension UIViewController {
    func showAlert(title: String, message: String? = nil, actionTitle: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: actionTitle, style: .default)
        alert.addAction(action)
        present(alert, animated: true)
    }
}
