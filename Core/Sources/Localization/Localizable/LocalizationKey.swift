//
// Copyright © 2021 Toby O'Connell. All rights reserved.
//

public enum LocalizationKey: String, CaseIterable {
    case first_name_title
    case first_name_textfield_placeholder
    case first_name_heading
    case first_name_body
    case first_name_button
    
    case last_name_title
    case last_name_textfield_placeholder
    case last_name_heading
    case last_name_body
    case last_name_button
}

extension LocalizationKey: Localizable {
    var localized: String { rawValue }
}
