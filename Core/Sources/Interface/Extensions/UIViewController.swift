//
//  UIViewController.swift
//
//
//  Created by Toby O'Connell on 27/03/2021.
//

import UIKit

extension UIViewController {
    func remove(child: UIViewController) {
        guard child.parent != nil else { return }
        child.willMove(toParent: nil)
        child.view.removeFromSuperview()
        child.removeFromParent()
    }

    func add(child: UIViewController) {
        addChild(child)
        view.addFillingSubview(child.view)
        child.willMove(toParent: self)
    }
}
