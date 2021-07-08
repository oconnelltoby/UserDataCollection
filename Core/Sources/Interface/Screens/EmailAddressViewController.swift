//
// Copyright © 2021 Toby O'Connell. All rights reserved.
//

import Localization

public struct EmailAddressViewModel {
    var minLength: UInt
    var maxLength: UInt
    var validate: (_ input: String) -> Result<() -> Void, Error>
    
    public init(minLength: UInt, maxLength: UInt, validate: @escaping (_ input: String) -> Result<() -> Void, Error>) {
        self.minLength = minLength
        self.maxLength = maxLength
        self.validate = validate
    }
}

public class EmailAddressViewController: SingleFieldViewController {
    public convenience init(viewModel: EmailAddressViewModel) {
        self.init(
            viewModel: .init(
                labels: .init(
                    title: localize(.email_address_title),
                    heading: localize(.email_address_heading),
                    body: localize(.email_address_body),
                    info: localize(.email_address_info(min: viewModel.minLength, max: viewModel.maxLength)),
                    button: localize(.email_address_button),
                    textField: localize(.email_address_textfield_placeholder)
                ),
                maxLength: viewModel.maxLength,
                validate: viewModel.validate
            )
        )
    }
}
