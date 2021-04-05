//
//  UIView.swift
//
//
//  Created by Toby O'Connell on 28/03/2021.
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
