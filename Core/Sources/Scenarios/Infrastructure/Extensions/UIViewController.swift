//
//  UIViewController.swift
//
//
//  Created by Toby O'Connell on 31/03/2021.
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
