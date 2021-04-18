//
// Copyright © 2021 Toby O'Connell. All rights reserved.
//

import Localization
import UIKit

public class FirstNameViewController: UIViewController {
    let textFieldDelegate = TextFieldDelegate().resignOnReturn()

    public init() {
        super.init(nibName: nil, bundle: nil)

        let textField = TextField(placeholder: localize(.first_name_textfield_placeholder))
        textField.delegate = textFieldDelegate

        let headding = UILabel.heading(localize(.first_name_heading))
        let body = UILabel.body(localize(.first_name_body))
        let button = UIButton.primary(localize(.first_name_button))
        let infoIcon = UIImageView.icon(systemName: "info.circle")
        let infoLabel = UILabel.body(localize(.first_name_info(min: 1, max: 50)))
        let infoStack = UIStackView(arrangedSubviews: [infoIcon, infoLabel]).styleAsRow()

        view = TemplateView(scrolling: [headding, body, textField, infoStack], footer: button)
        title = localize(.first_name_title)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
