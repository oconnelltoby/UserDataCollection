//
// Copyright © 2021 Toby O'Connell. All rights reserved.
//

import UIKit
import UserDataValidation

public struct SingleFieldViewModel {
    public struct Labels {
        var title: String
        var heading: String
        var body: String
        var info: String
        var button: String
        var textField: String
        
        public init(
            title: String,
            heading: String,
            body: String,
            info: String,
            button: String,
            textField: String
        ) {
            self.title = title
            self.heading = heading
            self.body = body
            self.info = info
            self.button = button
            self.textField = textField
        }
    }
    
    var labels: Labels
    var maxLength: UInt
    var validate: (_ input: String) -> Result<() -> Void, Error>

    public init(labels: Labels, maxLength: UInt, validate: @escaping (_ input: String) -> Result<() -> Void, Error>) {
        self.labels = labels
        self.maxLength = maxLength
        self.validate = validate
    }
}

public class SingleFieldViewController: UIViewController {
    private lazy var textFieldDelegate = TextFieldDelegate().resignOnReturn().capAt(length: viewModel.maxLength)
    private let viewModel: SingleFieldViewModel
    private lazy var heading = UILabel.heading(viewModel.labels.heading)
    private lazy var body = UILabel.body(viewModel.labels.body)
    private let infoIcon = UIImageView.icon(systemName: "info.circle")
    private lazy var infoLabel = UILabel.body(viewModel.labels.info)
    private lazy var infoStack = UIStackView(arrangedSubviews: [infoIcon, infoLabel]).styleAsRow()
    private lazy var textField = TextField(placeholder: viewModel.labels.textField).withDelegate(textFieldDelegate)
    private lazy var button = UIButton.primary(viewModel.labels.button)

    public init(viewModel: SingleFieldViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
        setupActions()

        view = TemplateView(scrolling: [heading, body, infoStack, textField], footer: button)
        title = viewModel.labels.title
    }
    
    private func setupActions() {
        button.addAction { [weak self] in
            guard let self = self else { return }

            switch self.viewModel.validate(self.textField.text ?? "") {
            case let .success(completion):
                self.textField.resignFirstResponder()
                completion()
            case .failure:
                self.textField.errorState = .error
                self.textField.shake()
                self.infoIcon.setTintColor(.error)
            }
        }

        textField.addAction { [weak self] in
            guard let self = self else { return }
            self.textField.errorState = .normal
            self.infoIcon.setTintColor(.primaryText)
        }
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
