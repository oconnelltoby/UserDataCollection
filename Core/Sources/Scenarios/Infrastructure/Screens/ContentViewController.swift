//
//  ComponentViewController.swift
//
//
//  Created by Toby O'Connell on 29/03/2021.
//

import Interface
import UIKit

class ContentViewController: UIViewController {
    init(contentProvider: StackContentProvider) {
        super.init(nibName: nil, bundle: nil)

        let scrollView = UIScrollView(contentProvider: contentProvider)
        view.addFillingSubview(scrollView)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
