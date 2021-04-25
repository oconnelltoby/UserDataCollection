//
// Copyright © 2021 Toby O'Connell. All rights reserved.
//

import Localization
import UIKit
import UserDataValidation

public struct FirstNameViewModel {
    var minLength: UInt
    var maxLength: UInt
    var validate: (_ name: String) -> Result<Void, Error>

    public init(minLength: UInt, maxLength: UInt, validate: @escaping (_ name: String) -> Result<Void, Error>) {
        self.minLength = minLength
        self.maxLength = maxLength
        self.validate = validate
    }
}

public class FirstNameViewController: UIViewController {
    let textFieldDelegate = TextFieldDelegate().resignOnReturn()

    public init(viewModel: FirstNameViewModel) {
        super.init(nibName: nil, bundle: nil)

        let headding = UILabel.heading(localize(.first_name_heading))
        let body = UILabel.body(localize(.first_name_body))
        let infoIcon = UIImageView.icon(systemName: "info.circle")
        let infoLabel = UILabel.body(localize(.first_name_info(min: viewModel.minLength, max: viewModel.maxLength)))
        let infoStack = UIStackView(arrangedSubviews: [infoIcon, infoLabel]).styleAsRow()
        let textField = TextField(placeholder: localize(.first_name_textfield_placeholder)).withDelegate(textFieldDelegate)
        let button = UIButton.primary(localize(.first_name_button)).addAction {
            switch viewModel.validate(textField.text ?? "") {
            case .success:
                textField.resignFirstResponder()
            case .failure:
                textField.errorState = .error
            }
        }

        let action = UIAction { [weak textField] _ in
            textField?.errorState = .normal
        }
        textField.addAction(action, for: .editingChanged)

        view = TemplateView(scrolling: [headding, body, infoStack, textField], footer: button)
        title = localize(.first_name_title)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
