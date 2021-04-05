//
//  WrappingViewController.swift
//
//
//  Created by Toby O'Connell on 27/03/2021.
//

import UIKit

open class WrappingViewController: UIViewController {
    public var content: UIViewController? {
        didSet {
            oldValue.map(remove)
            content.map(add)
            UIAccessibility.post(notification: .screenChanged, argument: nil)
        }
    }

    override public func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override public func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    public init() {
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    public required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
