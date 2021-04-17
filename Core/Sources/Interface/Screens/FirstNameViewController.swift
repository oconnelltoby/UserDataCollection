//
// Copyright © 2021 Toby O'Connell. All rights reserved.
//

import UIKit

public class FirstNameViewController: UIViewController {
    let textFieldDelegate = TextFieldDelegate().resignOnReturn()

    public init() {
        super.init(nibName: nil, bundle: nil)

        let textField = TextField(placeholder: "First name")
        textField.delegate = textFieldDelegate

        let headding = UILabel.heading("First name")
        let body = UILabel.body("Please enter your first name")
        let button = UIButton.primary("Next")
        let infoIcon = UIImageView.icon(systemName: "info.circle")
        let infoLabel = UILabel.body("Your name should be between 1 and 50 characters")
        let infoStack = UIStackView(arrangedSubviews: [infoIcon, infoLabel]).styleAsRow()

        view = TemplateView(scrolling: [headding, body, textField, infoStack], footer: button)
        title = "Your details"
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
