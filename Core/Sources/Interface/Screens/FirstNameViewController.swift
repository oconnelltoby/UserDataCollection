//
// Copyright © 2021 Toby O'Connell. All rights reserved.
//

import Localization

public struct FirstNameViewModel {
    var minLength: UInt
    var maxLength: UInt
    var validate: (_ name: String) -> Result<() -> Void, Error>
    
    public init(minLength: UInt, maxLength: UInt, validate: @escaping (_ name: String) -> Result<() -> Void, Error>) {
        self.minLength = minLength
        self.maxLength = maxLength
        self.validate = validate
    }
}

public class FirstNameViewController: SingleFieldViewController {
    public convenience init(viewModel: FirstNameViewModel) {
        self.init(
            viewModel: .init(
                labels: .init(
                    title: localize(.first_name_title),
                    heading: localize(.first_name_heading),
                    body: localize(.first_name_body),
                    info: localize(.first_name_info(min: viewModel.minLength, max: viewModel.maxLength)),
                    button: localize(.first_name_button),
                    textField: localize(.first_name_textfield_placeholder)
                ),
                maxLength: viewModel.maxLength,
                validate: viewModel.validate
            )
        )
    }
}
