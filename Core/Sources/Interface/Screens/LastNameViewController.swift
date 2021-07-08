//
// Copyright © 2021 Toby O'Connell. All rights reserved.
//

import Localization

public struct LastNameViewModel {
    var minLength: UInt
    var maxLength: UInt
    var validate: (_ name: String) -> Result<() -> Void, Error>
    
    public init(minLength: UInt, maxLength: UInt, validate: @escaping (_ name: String) -> Result<() -> Void, Error>) {
        self.minLength = minLength
        self.maxLength = maxLength
        self.validate = validate
    }
}

public class LastNameViewController: SingleFieldViewController {
    public convenience init(viewModel: LastNameViewModel) {
        self.init(
            viewModel: .init(
                labels: .init(
                    title: localize(.last_name_title),
                    heading: localize(.last_name_heading),
                    body: localize(.last_name_body),
                    info: localize(.last_name_info(min: viewModel.minLength, max: viewModel.maxLength)),
                    button: localize(.last_name_button),
                    textField: localize(.last_name_textfield_placeholder)
                ),
                maxLength: viewModel.maxLength,
                validate: viewModel.validate
            )
        )
    }
}
