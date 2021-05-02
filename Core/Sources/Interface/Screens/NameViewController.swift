//
// Copyright © 2021 Toby O'Connell. All rights reserved.
//

import Localization
import UIKit
import UserDataValidation

public struct NameViewModel {
    var minLength: UInt
    var maxLength: UInt
    var validate: (_ name: String) -> Result<Void, Error>

    public init(minLength: UInt, maxLength: UInt, validate: @escaping (_ name: String) -> Result<Void, Error>) {
        self.minLength = minLength
        self.maxLength = maxLength
        self.validate = validate
    }
}

public class NameViewController: UIViewController {
    private lazy var textFieldDelegate = TextFieldDelegate().resignOnReturn().capAt(length: viewModel.maxLength)
    private let viewModel: NameViewModel
    private let headding = UILabel.heading(.first_name_heading)
    private let body = UILabel.body(.first_name_body)
    private let infoIcon = UIImageView.icon(systemName: "info.circle")
    private lazy var infoLabel = UILabel.body(.first_name_info(min: viewModel.minLength, max: viewModel.maxLength))
    private lazy var infoStack = UIStackView(arrangedSubviews: [infoIcon, infoLabel]).styleAsRow()
    private lazy var textField = TextField(placeholder: localize(.first_name_textfield_placeholder)).withDelegate(textFieldDelegate)
    private let button = UIButton.primary(localize(.first_name_button))

    public init(viewModel: NameViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
        setupActions()

        view = TemplateView(scrolling: [headding, body, infoStack, textField], footer: button)
        title = localize(.first_name_title)
    }
    
    private func setupActions() {
        button.addAction { [weak self] in
            guard let self = self else { return }

            switch self.viewModel.validate(self.textField.text ?? "") {
            case .success:
                self.textField.resignFirstResponder()
            case .failure:
                self.textField.errorState = .error
            }
        }

        textField.addAction { [weak self] in
            guard let self = self else { return }
            
            self.textField.errorState = .normal
        }
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
